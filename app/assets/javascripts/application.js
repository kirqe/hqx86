// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.turbolinks    
//= require bootstrap-sprockets
//= require ns-autogrow
//= require turbolinks
  
$(document).ready(function(){
  $('#build_body').autogrow({vertical: true, horizontal: false});
});


// $(document).ready(function(){
//   $('#build_b_type').change(function(){
//     if ($('#build_b_type').val() == 'laptop') {
//       $('div#hw').hide();
//     } else {
//       $('div#hw').show();
//     }
//   });
// });


// $(document).ready(function(){
//  $("#new_post").submit(function(e){
//       e.submit(function(){
//           return false;
//       });
//   });
//
//   $("#new_build").submit(function(e){
//        e.submit(function(){
//            return false;
//        });
//    });
//
//    $("#new_contact").submit(function(e){
//         e.submit(function(){
//             return false;
//         });
//     });
// });
//
$(document).ready(function(){
  window.setTimeout(function() {
      $(".t-alert").fadeTo(500, 0).slideUp(500, function(){
          $(this).remove();
      });
  }, 3000);
});
//
// $(document).ready(function(){
//   maxCharacters = 500;
//   $('#count').text(maxCharacters);
//   $('#comment_body').bind('keyup keydown', function() {
//       var count = $('#count');
//       var characters = $(this).val().length;
//       count.text(maxCharacters - characters);
//   });
// });
//
$(document).ready(function(){
  $("#search").val('');
});

// $(document).ready(function(){
//
//   $("#contact_request_type").change(function(){
//     if ($("#contact_request_type").val() == 'Contact Us'){
//       $("div.contact_forms, .contact_fields").show();
//       $(".request_fields").hide();
//     }
//     else if ($("#contact_request_type").val() == 'Request a Build'){
//       $("div.contact_forms, .request_fields").show();
//       $(".contact_fields").hide();
//     }
//   });
// });