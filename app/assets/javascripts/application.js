// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require tinymce
//= require jquery_nested_form
//= require zeroclipboard
//= require_tree .

$(document).ready(
  function(){
  	$("#homepage_slider").bind("slider:changed", function (event, data) {
		  // The currently selected value of the slider
		  slider_value = Math.round(data.value);
		  $(".slider_value_number").text(slider_value);
		  $(".cake_value").text(Math.round((slider_value * 0.25) / 3));
		  $(".bottle_value").text(Math.round((slider_value * 0.25) * 2.6));
		  $(".dish_value").text(Math.round((slider_value * 0.25) * 10));
		  $(".cat_value").text(Math.round((slider_value * 0.25) / 0.6));
		});

		$(".dragger")
		  .mouseup(function() {
		    $(".slider_arrow").show();
		  })
		  .mousedown(function() {
		    $(".slider_arrow").hide();
		  });
  }
);

(function($){
    $.fn.extend({ 
        rotaterator: function(options) {
 
            var defaults = {
                fadeSpeed: 500,
                pauseSpeed: 100,
				child:null
            };
             
            var options = $.extend(defaults, options);
         
            return this.each(function() {
                  var o =options;
                  var obj = $(this);                
                  var items = $(obj.children(), obj);
				  items.each(function() {$(this).hide();})
				  if(!o.child){var next = $(obj).children(':first');
				  }else{var next = o.child;
				  }
				  $(next).fadeIn(o.fadeSpeed, function() {
						$(next).delay(o.pauseSpeed).fadeOut(o.fadeSpeed, function() {
							var next = $(this).next();
							if (next.length == 0){
									next = $(obj).children(':first');
							}
							$(obj).rotaterator({child : next, fadeSpeed : o.fadeSpeed, pauseSpeed : o.pauseSpeed});
						})
					});
            });
        }
    });
})(jQuery);

 $(document).ready(function() {
        $('#rotate').rotaterator({fadeSpeed:1500, pauseSpeed:1500});
 });
