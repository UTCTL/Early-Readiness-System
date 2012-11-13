// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
jQuery(document).ready(function(){


jQuery('.noscript').removeClass('noscript');

	jQuery('#student_highschool_attributes_district_id').change(function(){
		 if(this.selectedIndex != this.options.length - 1) {
		 	jQuery('#add_new_district').fadeOut();	
		 return;
		}
		jQuery('#add_new_district').fadeIn();

	});


	jQuery('#student_highschool_id').change(function(){
		 if(this.selectedIndex != this.options.length - 1) {
		 	jQuery('#add_highschool').fadeOut();	
		 return;
		}
		jQuery('#add_highschool').fadeIn();

	});

});