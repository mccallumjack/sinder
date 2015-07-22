(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.parallax').parallax();

    // Show the tutorial the first time the page loads.
    if ($('#repo-title').text() == "Sinder")
    {
      $('body').chardinJs('start');
    }

  }); // end of document ready
})(jQuery); // end of jQuery name space



