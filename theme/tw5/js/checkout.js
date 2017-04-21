$(document).ready(function(){
    //默认第一个属性选中
     $('#product_attr .bdbox').each(function(){
         $(this).find('input[type=radio]').eq(0).attr("checked", true);
     }) ;
    $("#combo").find('input[type=radio]').eq(0).attr("checked", true);
    refresh_price();
});

$('.combo').click(function () {
    refresh_price();
});

function addnumber(){
    $('#num').val(parseInt($('#num').val())+1);
    refresh_price() ;
}
function minnumber(){
    if($('#num').val()>1){
        $('#num').val(parseInt($('#num').val())-1);
        refresh_price() ;
    }
}
function inputnumber(){
    var number=parseInt($('#num').val());
    if(isNaN(number)||number < 1){
        $('#num').val('1');
        refresh_price();
    }else if(number > 1){
        $('#num').val(number);
    }
    refresh_price();
}
function refresh_price() {
    $.ajax({
        url: 'checkout.php?',
        type: 'post',
        data: $('#combo input[type=\'radio\']:checked,#product_attr input[type=\'hidden\'],input[name=\'num\']'),
        dataType: 'json',
        success: function(json) {
           if(json.ret)
           {
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
$(function () {
    //点击选择属性
    $("#dxbox label").eq(0).addClass("on1")
    $("#combo .dxbox label").eq(0).addClass("on1")
    $("#dxbox label").click(function(){
        $(this).addClass("on1").siblings().removeClass("on1");
    })
    $("#combo .dxbox label").click(function(){
        $(this).addClass("on1").siblings().removeClass("on1");
    })
    //判断图片是否超出范围
    if("#iin"){
        $("#dxbox label img").css({'width':'100%','max-height':'50px'})
    }else {
        $("#dxbox label img").css({'width':'100%','max-height':'100%'})
    }
    /*$("#dxbox label.on1").click(function () {
        $(".nav_top_left").html($("#dxbox label.on1 img"))
    })*/
})