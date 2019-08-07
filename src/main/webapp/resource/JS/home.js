$(document).ready(function () {
    $("#home-carousel").owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        items: 1,
        singleItem: true,
        autoplay: true,
        autoPlaySpeed: 200,
        autoPlayTimeout: 400,
        autoplayHoverPause: true
    });
});