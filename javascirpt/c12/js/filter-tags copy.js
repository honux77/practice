(function(){

  var $imgs = $('#gallery img');                  // Store all images
  var $buttons = $('#buttons');                   // Store buttons element
  var tagged = {};                                // Create tagged object

  $imgs.each(function(){                          // Loop through images and
    var img = this,                               // Store img in variable
        tags = $(this).data('tags');              // Get this element's tags

    if (tags) {                                   // If the element had tags
      tags.split(',').forEach(function(tagName) { // Split at comma and
        if (tagged[tagName] == null) {            // If object doesn't have tag
          tagged[tagName] = [];                   // Add empty array to object
        }
        tagged[tagName].push(img);                // Add the image to the array
      });
    }
  });

  $('<button/>', {                                 // Create empty button
    text: 'Show All',                              // Add text 'show all'
    class: 'active',                               // Make it active
    click: function(e) {                           // Add onclick handler to
      $buttons.children().removeClass('active');   // Clear active button
      $(this).addClass('active');                  // Make clicked item active
      $imgs.show();                                // Show all images
    }
  }).appendTo($buttons);                           // Add to buttons

  Object.keys(tagged).forEach(function(tagName){   // For each tag name
    $('<button/>', {                               // Create empty button
      text: tagName + ' ('+tagged[tagName].length+')', // Add tag name as text
      click: function(e) {                         // Add click handler
        $buttons.children().removeClass('active'); // Clear active button
        $(this).addClass('active');                // Make clicked item active
        $imgs.hide();                              // Hide all images
        $(tagged[tagName]).show();                 // Show images with this tag
      }  
    }).appendTo($buttons);                         // Add to the buttons
  });

}());