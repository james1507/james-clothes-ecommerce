<?php

namespace App\Http\Controllers;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\CPU\OrderManager;
use Brian2694\Toastr\Facades\Toastr;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class VNPayController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function payWithcnpay(Request $request)
    {
        try {
            $coupon_dis=0;
            $total_vnp_amount = 0;
            $sub_total=0;
            $total_tax=0;
            $total_shipping_cost=0;
            $total_discount_on_product=0;
            $cart=\App\CPU\CartManager::get_cart();
            $shipping_cost=\App\CPU\CartManager::get_shipping_cost();
            if(session()->has('coupon_discount')) {
                $coupon_dis=session('coupon_discount');
            }

            if($cart->count() > 0) {
                foreach($cart as $key => $cartItem) {
                    $sub_total+=$cartItem['price']*$cartItem['quantity'];
                    $total_tax+=$cartItem['tax']*$cartItem['quantity'];
                    $total_discount_on_product+=$cartItem['discount']*$cartItem['quantity'];
                }
                $total_shipping_cost=$shipping_cost;

                $total_vnp_amount = $sub_total+$total_tax+$total_shipping_cost-$coupon_dis-$total_discount_on_product;
            } else {
                $total_vnp_amount = 0;
            }

            $vnpay = Helpers::get_business_settings('vnpay');
            $vnp_TmnCode = $vnpay['vnp_TmnCode']; //Mã định danh merchant kết nối (Terminal Id)
            $vnp_HashSecret = $vnpay['vnp_HashSecret']; //Seret key
            $vnp_Url = $vnpay['vnp_Url'];
            $vnp_Returnurl = route('returnUrl-vnpay'); //?
            //Config input format
            //Expire
            $startTime = date("YmdHis");
            $expire = date('YmdHis', strtotime('+15 minutes', strtotime($startTime)));

            $vnp_TxnRef = rand(1, 10000); //Mã giao dịch thanh toán tham chiếu của merchant
            $vnp_Amount = $total_vnp_amount; // Số tiền thanh toán
            $vnp_Locale = 'vn'; //Ngôn ngữ chuyển hướng thanh toán
            $vnp_BankCode = ''; //Mã phương thức thanh toán
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR']; //IP Khách hàng thanh toán

            $inputData = array(
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $vnp_Amount * 100,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => date('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => $vnp_Locale,
                "vnp_OrderInfo" => "Thanh toan GD:" . $vnp_TxnRef,
                "vnp_OrderType" => "other",
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef,
                "vnp_ExpireDate" => $expire
            );

            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }


            ksort($inputData);

            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';
            }

            $vnp_Url = $vnp_Url . "?" . $query;
            if (isset($vnp_HashSecret)) {
                $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret); //  
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
            }
            return redirect($vnp_Url);
        } catch (Exception $e) {
            Log::alert($e->getMessage());
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function returnUrlVnPay(Request $request)
    {
        //
        try {
            $vnpay = Helpers::get_business_settings('vnpay');
            $vnp_HashSecret = $vnpay['vnp_HashSecret'];
            $vnp_SecureHash = $request->vnp_SecureHash;
            $inputData = array();
            foreach ($_GET as $key => $value) {
                if (substr($key, 0, 4) == "vnp_") {
                    $inputData[$key] = $value;
                }
            }

            unset($inputData['vnp_SecureHash']);
            ksort($inputData);
            $i = 0;
            $hashData = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashData = $hashData . urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
            }

            $secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);
            if ($secureHash == $vnp_SecureHash) {
                if ($request['vnp_ResponseCode'] == '00') {
                    $unique_id = OrderManager::gen_unique_id();
                    $order_ids = [];
                    foreach (CartManager::get_cart_group_ids() as $group_id) {
                        $data = [
                            'payment_method' => 'vnpay',
                            'order_status' => 'confirmed',
                            'payment_status' => 'paid',
                            'transaction_ref' => $unique_id,
                            'order_group_id' => $unique_id,
                            'cart_group_id' => $group_id
                        ];
                        $order_id = OrderManager::generate_order($data);
                        array_push($order_ids, $order_id);
                    }

                    CartManager::cart_clean();
                    if (session()->has('payment_mode') && \session('payment_mode') == 'app') {
                        return redirect()->route('payment-success');
                    }

                    if (auth('customer')->check()) {
                        Toastr::success('Payment success.');
                        return view('web-views.checkout-complete');
                    }
                } else {
                    if (session()->has('payment_mode') && \session('payment_mode') == 'app') {
                        return redirect()->route('payment-fail');
                    }
                }
            } else {
                dd("Chu ky khong hop le");
            }
        } catch (Exception $e) {
            Log::alert($e->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
