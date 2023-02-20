@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Payment Method'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Title -->
        <div class="mb-4 pb-2">
            <h2 class="h1 mb-0 text-capitalize d-flex align-items-center gap-2">
                <img src="{{asset('/public/assets/back-end/img/3rd-party.png')}}" alt="">
                {{\App\CPU\translate('3rd_party')}}
            </h2>
        </div>
        <!-- End Page Title -->

        <!-- Inlile Menu -->
    @include('admin-views.business-settings.third-party-inline-menu')
    <!-- End Inlile Menu -->

        <div class="row gy-3">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="mb-4 text-uppercase d-flex">{{\App\CPU\translate('PAYMENT_METHOD')}}</h5>

                        @php($config=\App\CPU\Helpers::get_business_settings('cash_on_delivery'))
                        <form action="{{route('admin.business-settings.payment-method.update',['cash_on_delivery'])}}"
                              style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <label
                                    class="mb-3 d-block font-weight-bold title-color">{{\App\CPU\translate('cash_on_delivery')}}</label>

                                <div class="d-flex flex-wrap gap-5">
                                    <div class="d-flex gap-10 align-items-center mb-2">
                                        <input id="system-default-payment-method-active" type="radio" name="status"
                                               value="1" {{$config['status']==1?'checked':''}}>
                                        <label for="system-default-payment-method-active"
                                               class="title-color mb-0">{{\App\CPU\translate('Active')}}</label>
                                    </div>
                                    <div class="d-flex gap-10 align-items-center mb-2">
                                        <input id="system-default-payment-method-inactive" type="radio" name="status"
                                               value="0" {{$config['status']==0?'checked':''}}>
                                        <label for="system-default-payment-method-inactive"
                                               class="title-color mb-0">{{\App\CPU\translate('Inactive')}}</label>
                                    </div>
                                </div>

                                <div class="mt-3 d-flex flex-wrap justify-content-end gap-10">
                                    <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}"
                                            onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}"
                                            class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('submit')}}</button>
                                    @else
                                        <button type="submit"
                                                class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('Configure')}}</button>
                                    @endif
                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="mb-4 text-uppercase d-flex">{{\App\CPU\translate('PAYMENT_METHOD')}}</h5>

                        @php($config=\App\CPU\Helpers::get_business_settings('digital_payment'))
                        <form action="{{route('admin.business-settings.payment-method.update',['digital_payment'])}}"
                              style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <label
                                    class="title-color font-weight-bold d-block mb-3">{{\App\CPU\translate('digital_payment')}}</label>

                                <div class="d-flex flex-wrap gap-5">
                                    <div class="d-flex gap-10 align-items-center mb-2">
                                        <input id="digital-payment-method-active" type="radio" name="status"
                                               value="1" {{$config['status']==1?'checked':''}}>
                                        <label for="digital-payment-method-active"
                                               class="title-color mb-0">{{\App\CPU\translate('Active')}}</label>
                                    </div>
                                    <div class="d-flex gap-10 align-items-center mb-2">
                                        <input id="digital-payment-method-inactive" type="radio" name="status"
                                               value="0" {{$config['status']==0?'checked':''}}>
                                        <label for="digital-payment-method-inactive"
                                               class="title-color mb-0">{{\App\CPU\translate('Inactive')}}</label>
                                    </div>
                                </div>

                                <div class="mt-3 d-flex flex-wrap justify-content-end gap-10">
                                    <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}"
                                            onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}"
                                            class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('submit')}}</button>
                                    @else
                                        <button type="submit"
                                                class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('Configure')}}</button>
                                    @endif
                                </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        @php($config=\App\CPU\Helpers::get_business_settings('vnpay'))
                        <form action="{{route('admin.business-settings.payment-method.update',['vnpay'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                @php($config['environment'] = $config['environment']??'sandbox')
                                <div class="d-flex flex-wrap gap-2 justify-content-between mb-3">
                                    <h5 class="text-uppercase">{{\App\CPU\translate('vnpay')}}</h5>

                                    <label class="switcher show-status-text">
                                        <input class="switcher_input" type="checkbox"
                                               name="status" value="1" {{$config['status']==1?'checked':''}}>
                                        <span class="switcher_control"></span>
                                    </label>
                                </div>

                                <center class="mb-3">
                                    <img src="{{asset('/public/assets/back-end/img/vnpay.jpg')}}" alt="">
                                </center>

                                <div class="form-group">
                                    <label class="d-flex title-color">vnp_TmnCode</label>
                                    <input type="text" class="form-control" name="vnp_TmnCode"
                                           value="{{env('APP_MODE')=='demo'?'':$config['vnp_TmnCode']}}">
                                </div>

                                <div class="form-group">
                                    <label class="d-flex title-color">vnp_HashSecret</label>
                                    <input type="text" class="form-control" name="vnp_HashSecret"
                                           value="{{env('APP_MODE')=='demo'?'':$config['vnp_HashSecret']}}">
                                </div>
                                <div class="form-group">
                                    <label class="d-flex title-color">vnp_Url</label>
                                    <input type="text" class="form-control" name="vnp_Url"
                                           value="{{env('APP_MODE')=='demo'?'':$config['vnp_Url']}}">
                                </div>
                                <div class="mt-3 d-flex flex-wrap justify-content-end gap-10">
                                    <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}"
                                            onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}"
                                            class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('save')}}</button>
                                    @else
                                        <button type="submit"
                                                class="btn btn--primary px-4 text-uppercase">{{\App\CPU\translate('Configure')}}</button>
                                    @endif
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        function copyToClipboard(element) {
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val($(element).text()).select();
            document.execCommand("copy");
            $temp.remove();
            toastr.success("{{\App\CPU\translate('Copied to the clipboard')}}");
        }
    </script>
@endpush
