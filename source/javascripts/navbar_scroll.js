$(document).ready(function () {

  'use strict';

   var c, currentScrollTop = 0,
       navbar = $('nav.scroll-navbar');
       console.log(navbar);
    if (scrollY === 0) {

          navbar.addClass("scrollUp");
      }


   $(window).scroll(function () {
      var a = $(window).scrollTop();
      var b = navbar.height();

      currentScrollTop = a;


      if (c < currentScrollTop && a > b + b) {
        navbar.removeClass("scrollUp"); // show navbar
      } else if (c > currentScrollTop && !(a <= b)) {
        navbar.addClass("scrollUp"); //hide navbar
      }

      c = currentScrollTop;
  });

});
