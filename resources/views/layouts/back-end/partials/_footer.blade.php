

<div class="footer">
    <div class="row justify-content-between align-items-center">
        <div class="col-lg-4 mb-3 mb-lg-0">
            <p class="font-size-sm mb-0 title-color text-center text-lg-left">
                &copy; {{\App\Model\BusinessSetting::where(['type'=>'company_name'])->first()->value}}. <span
                    class="d-none d-sm-inline-block">{{\App\Model\BusinessSetting::where(['type'=>'company_copyright_text'])->first()->value}}</span>
            </p>
        </div>
        
    </div>
</div>
