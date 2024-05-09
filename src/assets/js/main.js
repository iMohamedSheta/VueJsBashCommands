(function($) {
    "use strict";
    // let theme = localStorage.getItem("theme");
    // if(theme == 'dark'){
    //     $('body').removeClass('light-mode').addClass('dark-mode');
    //     $('layout-setting').find('i').removeClass('fe-sun').addClass('fe-moon');
    // }else{
    //     $('body').removeClass('dark-mode').addClass('light-mode');
    //     $('layout-setting').find('i').removeClass('fe-moon').addClass('fe-sun');
    // }
    
    //_____________ Dark Mode Switch
    // $('.layout-setting').on("click", function(e) {
    //     if ($('body').hasClass("light-mode")) {
    //         localStorage.setItem("theme","dark");
    //     }else{
    //         localStorage.setItem("theme","light");
    //     }
    //     themeSwitch();
    // });

    // function themeSwitch(){
    //     let theme = localStorage.getItem("theme");
    //     if(theme == "dark"){
    //         $('body').removeClass('light-mode').addClass('dark-mode');
    //         $('layout-setting').find('i').removeClass('fe-sun').addClass('fe-moon');
    //     }else{
    //         $('body').removeClass('dark-mode').addClass('light-mode');
    //         $('layout-setting').find('i').removeClass('fe-moon').addClass('fe-sun');
    //     }
    // }
    // themeSwitch();

    // if (localStorage.getItem("theme") === 'dark') {
    //     $('layout-setting').find('i').removeClass('fe-sun').addClass('fe-moon');
    //     $('body').removeClass('light-mode').addClass('dark-mode');
    //     if ($('body').hasClass("light-mode")) {
    //         $('body').toggleClass('dark-mode');
    //     }
        
    // }

    // ______________ Perfect Scrollbar
    if($('.scrollable-container').length > 0){
        $('.scrollable-container').perfectScrollbar({
            theme:"dark"
        });
    }

    // ______________ Page full screen
    $('.full-screen-link').on('click', function(e) {
        if (typeof screenfull != 'undefined'){
            if (screenfull.enabled) {
                screenfull.toggle();
            }
        }
    });
    if (typeof screenfull != 'undefined'){
        if (screenfull.enabled) {
            $(document).on(screenfull.raw.fullscreenchange, function(){
                if(screenfull.isFullscreen){
                    $('.full-screen-link').find('i').removeClass('fe-maximize').addClass('fe-minimize');
                }
                else{
                    $('.full-screen-link').find('i').removeClass('fe-minimize').addClass('fe-maximize');
                }
            });
        }
    }

    // ______________ BACK TO TOP BUTTON
    $(window).on("scroll", function(e) {
        if ($(this).scrollTop() > 0) {
            $('#back-to-top').fadeIn('slow');
        } else {
            $('#back-to-top').fadeOut('slow');
        }
    });
    $(document).on("click", "#back-to-top", function(e) {
        $("html, body").animate({
            scrollTop: 0
        }, 0);
        return false;
    });


    // ______________ COVER IMAGE
    $(".cover-image").each(function() {
        var attr = $(this).attr('data-bs-image-src');
        if (typeof attr !== typeof undefined && attr !== false) {
            $(this).css('background', 'url(' + attr + ') center center');
        }
    });

    // ______________ FUNCTIONS FOR COLLAPSED CARD
    $(document).on('click', '[data-bs-toggle="card-collapse"]', function(e) {
        let $card = $(this).closest(DIV_CARD);
        $card.toggleClass('card-collapsed');
        e.preventDefault();
        return false;
    });

    // ______________ CARD FULL SCREEN
    $(document).on('click', '[data-bs-toggle="card-fullscreen"]', function(e) {
        let $card = $(this).closest(DIV_CARD);
        $card.toggleClass('card-fullscreen').removeClass('card-collapsed');
        e.preventDefault();
        return false;
    });
})(jQuery);

//Email Inbox
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});

/*off canvas Style*/
$('.off-canvas').on('click', function() {
    $('body').addClass('overflow-y-scroll');
    $('body').addClass('pe-0');
});

$('.layout-setting').on("click", function(e) {
    if ($('body').hasClass("dark-mode")) {
        $('layout-setting').find('i').removeClass('fe-sun').addClass('fe-moon');
        $('body').toggleClass('dark-mode');
    } else {
        $('layout-setting').find('i').removeClass('fe-moon').addClass('fe-sun');
        $('body').removeClass('dark-mode');
        $('body').addClass('light-mode');
    }
});