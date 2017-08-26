$(window).on("scroll",function(){
    var window_height = $(window).height(); //浏览器当前窗口可视区域高度
    var document_height = $(document).height(); //浏览器当前窗口文档的高度
    var scroll_top = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
    var standard_line = $('.list_cont_box').offset().top;
    var standard_line_wrap = $('#cont_main_line').height();
    var fixed_self = $('#sidebar_fix').height();
    if(fixed_self) {
        if(scroll_top > (standard_line)){
            $('#sidebar_fix').addClass('fixed');
            $('.sidebar_box').css('bottom','auto');
        }else {
            $('#sidebar_fix').removeClass('fixed');
            $('.sidebar_box').css('bottom','auto');
        }

        if(scroll_top > (standard_line + standard_line_wrap - fixed_self) ){
            $('#sidebar_fix').removeClass('fixed');
            $('.sidebar_box').css('bottom','0');
        }
    }
});


$(function () {
    /*
    * TODO: price 价格交互
    * */
    $('.minus_btn,.add_btn').click(function () {
      var num = null;
      var dom = $(this).parent().children('input');
      num = dom.val();
      if($(this).hasClass('minus_btn')){
          dom.val(++num);
      }else {
          num <=0 ? num = 0 : dom.val(--num);
      }
        addPrice();
    });


    function addPrice() {
        var price = $('.reserve_form .price span').text();
        var num_adult = $('.num_adult').val()
            num_child = $('.num_child').val();
        var all_price = (parseInt(num_adult)+parseInt(num_child)) * price;
        $('.all_price').text('¥'+all_price)
    }
});