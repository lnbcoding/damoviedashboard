$(document).ready(function() {
  $(".popular-movies-home").hide();

  $(".popular-movies-link a").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: '/',
      type: 'GET'
    }).done(function() {
      $(".popular-movies-home").show();
      $(".popular-movies-link").hide();
    });
  });

  $(".hide-movie-info").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: '/',
      type: 'GET'
    }).done(function() {
      $(".popular-movies-home").hide();
    });
  });

});

// $(".fancybox").fancybox();

// $(".fancybox-button").fancybox({
//   prevEffect    : 'none',
//   nextEffect    : 'none',
//   closeBtn    : false,
//   helpers   : {
//     title : { type : 'inside' },
//     buttons : {}
//   }
// });
