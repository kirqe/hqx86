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
//= require typeahead.bundle.min
//= require turbolinks
  
$(document).ready(function(){
  $('#build_body').autogrow({vertical: true, horizontal: false});
});

$(document).ready(function(){
  window.setTimeout(function() {
      $(".t-alert").fadeTo(500, 0).slideUp(500, function(){
          $(this).remove();
      });
  }, 3000);
});

$(document).ready(function(){
  $("#search").val('');
});

jQuery(function($) {  
  var $vartypeahead = $('#build_search');
  var engine = new Bloodhound({
    remote: { 
        url: "/builds/autocomplete?query=%QUERY",
        wildcard: "%QUERY"
    },
    datumTokenizer: function(d) { return d;},
    queryTokenizer: function(d) { return d;}
  });
  engine.initialize();

  $vartypeahead.typeahead({
    "minLength": 3,
    "highlight": true
  },
  {  displayKey: function(build){ return build.name+': '+build.spec},
    "source": engine.ttAdapter()
    }); 
});
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