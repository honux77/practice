// NOTE: This example will not work locally: 
// In Chrome / IE / Safari you may experience problems because of cross-domain restrictions.
// In Firefox, content may load but styles may not be applied.
// You can try it out on the website for the book http://javascriptbook.com/code/c08/
// or run it on your own server.

$('nav a').on('click', function(e) {
  e.preventDefault();
  var url = this.href;                                      // URL to load
  var $content = $('#content');                             // Cache selection

  $('nav a.current').removeClass('current');                // Update links
  $(this).addClass('current');
  $('#container').remove();                                 // Remove content

  $.ajax({
    type: "POST",                                           // GET or POST
    url: url,                                               // Path to file
    timeout: 2000,                                          // Waiting time
    beforeSend: function() {                                // Before Ajax 
      $content.append('<div id="load">Loading</div>');      // Load message
    },
    complete: function() {                                  // Once finished
      $('#load').remove();                               // Clear message
    },
    success: function(data) {                               // Show content
      $content.html( $(data).find('#container') ).hide().fadeIn(400);
    },
    fail: function() {                                      // Show error msg 
      $('#panel').html('<div class="loading">Please try again soon.</div>');
    }
  });

});