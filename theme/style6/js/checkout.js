
$(document).ready(function(){
    // 初始化选择
    $("#comb label").eq(0).children('input').attr("checked", 'true');
    // $('li.protoLayer .con label').eq(0).addClass('active').children('input').attr("checked", 'true');
    $('li.protoLayer').each(function(){
        $(this).find('label').eq(0).addClass('active').children('input').attr("checked", 'true');
    });

    refresh_price();

    $("#comb label input").click(function(event) {
        /* Act on the event */
        refresh_price();
    });

    $('.protoLayer .con label').click(function(event) {
        /* Act on the event */
        $(this).addClass('active').siblings().removeClass('active');
        if( $(this).find('img').length >0 ){
            var src = $(this).find('img').attr('src');
            $('.store-goods .i-img img').attr('src', src);
        }
    });


}) ;

    
function addnumber(){
    $('#mun').val(parseInt($('#mun').val())+1);
    refresh_price();
}
function minnumber(){
    if($('#mun').val()>1){
        $('#mun').val(parseInt($('#mun').val())-1);
        refresh_price();
    }
}

function refresh_price() {
    $('[data-render="count"]').html($('#mun').val());
    $.ajax({
        url: 'checkout.php?',
        type: 'post',
        data: $('input[name=combo_id]:checked, #act, input[name=\'num\']'),
        dataType: 'json',
        success: function(json) {
           if(json.ret)
           {
                $('combprice').html(json.price);
                $("#price").html(json.total);
              $("input[name='price']").val(json.total);
           }
           else{
               alert(json.msg)
           }
        },
        error: function(xhr, ajaxOptions, thrownError) {
        }
    });
}
    
var _region = $("#_region").val();
//window.onerror = function(){return true;}
//function $(id){return document.getElementById(id);}
//function getHeight(){$("fahuo").style.height=$("forml").offsetHeight-85+"px";}
//window.onload = function(){getHeight();}
/*///////////////////////////////////////// ORDERJSFGX /////////////////////////////////////////*/
function postcheck(){

    try{
        if (document.form.name.value==""){
            alert('請填寫姓名！');
            document.form.name.focus();
            return false;
        }
        var name = /^[a-zA-Z\u4e00-\u9fa5\s]{2,}$/;
        if (!name.test(document.form.name.value)){
            alert('姓名格式不正確，請重新填寫！');
            document.form.name.focus();
            return false;
        }
    }
    catch(ex){
    }
    // try{
    //     if (document.form.email.value==""){
    //         alert('請填寫郵箱地址！');
    //         document.form.email.focus();
    //         return false;
    //     }
    //     if (!/^([a-zA-Z0-9_-]|.)+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(document.form.email.value)) {
    //         alert('郵箱格式不正確，請重新填寫！');
    //         document.form.email.focus();
    //         return false;
    //     }
    // }
    // catch(ex){
    // }
    try{
        if (document.form.mob.value==""){
            alert('請填寫手機號碼！');
            document.form.mob.focus();
            return false;
        }
        switch(_region){
            case "台灣":
                if (/^09/.test(document.form.mob.value) && !/^\d{10}$/.test(document.form.mob.value)) {
                    alert('手機號碼格式不正確，請重新填寫！');
                    document.form.mob.focus();
                    return false;
                }
                if (!/^0\d{6,10}/.test(document.form.mob.value)) {
                    alert('手機號碼格式不正確，請重新填寫！');
                    document.form.mob.focus();
                    return false;
                }
                break;
            case "香港":
                
                break;
        }
    }
    catch(ex){
    }
    try{
        if (document.form.province.value==""){
            alert('请选择所在地区！');
            document.form.province.focus();
            return false;
        }
    }
    catch(ex){
    }
    try{
        if (document.form.address.value==""){
            alert('请填写详细地址！');
            document.form.address.focus();
            return false;
        }
    }
    catch(ex){
    }   
    return true;
}