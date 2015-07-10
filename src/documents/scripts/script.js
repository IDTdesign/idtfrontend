/* Your scripts go here */
(function ($) {
    //$('.homepage_promo').alfablur({"gradiend_with" : 0,"blur_width": 30,"blur_radius": 100});

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

    // detecting ios and android to hide unnecessary appstore buttons
    if (bowser.android) {
        $("html").addClass("android");
    } else if (bowser.ios) {
        $("html").addClass("ios");
    }

    var img = $('.blur');
    if (img) {
    // blur default settings
        if ($(window).width() >600) {

            var params = {};

                params.callBack = function () {
                    $('canvas').addClass('visible')
                };

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
                if (img.data('blur_page')) {
                    params.blur_page = img.data('blur_page');
                }
                if (img.data('blur_page_alfa')) {
                    params.blur_page_alfa = img.data('blur_page_alfa');
                }
                $(img).alfablur(params);
        } else {
            $('.blur').attr('src', $('.blur').data('src'));
        }
    }

    // Popover for titles
    if ($('.island--title-popover-trigger').length > 0) {
        $('.island--title-popover-trigger').on('click', '.island--title-popover-icon', function(event) {

            event.preventDefault();

            var popoverTrigger = $('.island--title-popover-trigger'),
                popoverViewport = '.island--title-popover',
                popoverTriggerNeed = $(this).parent(),
                popoverContent = popoverTriggerNeed.next('.island--title-popover-content');

            popoverTrigger.each(function() {
                $(this).popover('destroy');
            });

            popoverTriggerNeed.popover({
                html: true,
                placement: 'bottom',
                viewport: popoverViewport,
                content: function () {
                    return popoverContent.html();
                },
                title: function () {
                    return '';
                },
                template: '<div class="popover island--title-popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
            });

            popoverTrigger.popover('show');

            $('.island').on('click', '.island--title-popover-close', function (event) {
                event.preventDefault();
                popoverTriggerNeed.popover('destroy');
            });
        });
    }

}(jQuery));
