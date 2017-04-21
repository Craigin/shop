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
        url: '/checkout.php?',
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

    $("#address1, #address2, #address3").change(function(event) {
        event.preventDefault();
        var ad1 = $('#address1').val();
        var ad2 = $('#address2').val();
        var ad3 = $('#address3').val();
        $("[name=address]").val(ad1+ad2+ad3);
        //console.log($("[name=address]").val());
    });

function postcheck(){
    return true;
}