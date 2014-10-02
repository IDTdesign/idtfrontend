/* Your scripts go here */
(function ($) {
    //$('.homepage_promo').alfablur({"gradiend_with" : 0,"blur_width": 30,"blur_radius": 100});
    $('footer h4, .mobile_menu h4').click(function(){
        $(this).parent().toggleClass('active');
    });
    /*$('header nav, .mobile_menu .close').click(function(){
        if ($(window).width() < 920) {
            $('body').toggleClass('show_menu');

            return false;
        }
    });*/
    /*$('.dropdown').click(function(){
        $(this).toggleClass('open');
        return false;
    });
    $('.dropdown').hover(
        function(){},
        function(){
            $(this).removeClass('open');
        }
    );*/

    /*if ($(window).width() > 1024) {*/
    //  var promo = $('.homepage_promo');
    //  promo.css('background-image','url('+promo.find('.homepage_image').attr('data-wide')+')');
    /*}*/

    //$(".dial").knob({'readOnly': true, 'fgColor':"#cc0000", 'bgColor':'#9eb7cf'});


    /* nav-bossmain */

    // $("#topmenu").sticky({topSpacing:0, wrapperClassName: "hold", className:"fixed"});

    // detect scrolling direction
    // add class to body

    $(function(){
        var lastScrollTop = 0, delta = 5;
        $(window).scroll(function(event){
           var st = $(this).scrollTop();

           if(Math.abs(lastScrollTop - st) <= delta)
              return;

           if (st > lastScrollTop){
               // downscroll code
               $("body").removeClass("scrolltop").addClass("scrolldown");
           } else {
              // upscroll code
              $("body").removeClass("scrolldown").addClass("scrolltop");
           }
           lastScrollTop = st;
        });
    });

    // local navigation
    $(".local-nav")
    .sticky({
        topSpacing:0,
        wrapperClassName: "hold",
        className:"fixed-local-nav"
    })
    .localScroll({
        offset:-70,
        duration:500
    });

    // blur default settings
    if ($(window).width() > 1300) {

        var img = $('.blur'),
            params = {};

            params.callBack = function () {
                $('canvas').addClass('visible')
            }
           
            if (img.data('gradient_width')) {
                params.gradient_width = img.data('gradient_width');
            }
            if (img.data('blur_width')) {
                params.blur_width = img.data('blur_width');
            }
            if (img.data('blur_radius')) {
                params.blur_radius = img.data('blur_radius');
            }
            if (img.data('vertical_gradient')) {
                params.vertical_gradient = img.data('vertical_gradient');
            }
            $(img).alfablur(params);       
    } else {
        $('.blur').attr('src', $('.blur').data('src'));     
    }

}(jQuery));
