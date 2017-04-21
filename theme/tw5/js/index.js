function ShowCountDown(year,month,day,divname){
    var now = new Date();
    var endDate = new Date(year,month-1, day, now.getHours()+8);
    var leftTime=endDate.getTime()-now.getTime();
    var leftsecond = parseInt(leftTime/1000);
    var day1=Math.floor(leftsecond/(60*60*24));
    var hour=Math.floor((leftsecond-day1*24*60*60)/3600);
    var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60);
    var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60);
    var cc = document.getElementById(divname);
    cc.innerHTML ="<span id='h'>"+0+hour+"</span>"+"<span class='colon'>:</span>"+"<span id='m'>"+minute+"</span>"+"<span class='colon'>:</span>"+"<span id='s'>"+second+"</span>"+"<span class='colon'></span>";

}
window.setInterval(function(){ShowCountDown(2018,4,20,'timer');}, 1000);


$(function () {
    var h = $(window).height();
    var mySwiper1 = new Swiper('.swiper-container', {
        autoplay: 3000,
        loop: false,
        autoHeight:true,
        pagination: '.swiper-pagination',
        paginationType: 'custom',
        paginationCustomRender: function(swiper, current, total) {
            var text = "";
            for (var i = 1; i <= total; i++) {
                if (current == i) {
                    text += "<span class='redicon'></span>";
                } else {
                    text += "<span class='whiteicon'></span>";
                }
            }
            return text;
        }
    });

    //大图弹出
    $(".small_bg .img_content img").click(function () {
        var dj = $(this).index()
        console.log(dj)
        $(".big_banner img").eq(dj).fadeIn()
        $(".big_banner").css({display:'block'})
    })
    $(".big_banner div").click(function () {
        $(".big_banner img").fadeOut()
        $(".big_banner").fadeOut()
    })
    $("#btn_buy").click(function () {
        window.location.href="checkout.php";
    })
})