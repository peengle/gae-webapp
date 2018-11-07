console.log('pages.main.script.loaded');

$(function() {
  $('#js-navbar-toogle').on('click', function() {
    $('#js-menu').toggle();
  });
  navbar_state();
  $(window).scroll(navbar_state)
});

function navbar_state() {
  var scroll = $(window).scrollTop();
  if (scroll > 50) {
    $('.navbar').addClass('navbar--bg');
  } else {
    $('.navbar').removeClass('navbar--bg');
  }
}
