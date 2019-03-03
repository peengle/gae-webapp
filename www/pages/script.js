console.log('pages.main.script.loaded');

$(function() {
  var slideout = new Slideout({
    'panel': document.getElementById('panel'),
    'menu': document.getElementById('menu'),
    'padding': 256,
    'tolerance': 70,
    'side': 'right'
  });

  // Hamburger Menu Toggle button
  $('.toggle-button').on('click', function() {
      slideout.toggle();
  });
});

