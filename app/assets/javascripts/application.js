// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$('#previous_list').click(function(){
  		$.ajax("/lists/back_one_list")

	});
});




// 	var	email = $( "#email" ),
// 		password = $( "#password" ),
// 		allFields = $( [] ).add( email ).add( password ),
// 		tips = $( ".validateTips" );
// 
// 	function updateTips( t ) {
// 		tips
// 			.text( t )
// 			.addClass( "ui-state-highlight" );
// 			setTimeout(function() {
// 			tips.removeClass( "ui-state-highlight", 1500 );
// 		}, 500 );
// 	}
// 
// 	function checkLength( o, n, min, max ) {
// 		if ( o.val().length > max || o.val().length < min ) {
// 			o.addClass( "ui-state-error" );
// 			updateTips( "Length of " + n + " must be between " +
// 				min + " and " + max + "." );
// 			return false;
// 		} else {
// 			return true;
// 		}
// 	}
// 
// 	function checkRegexp( o, regexp, n ) {
// 		if ( !( regexp.test( o.val() ) ) ) {
// 			o.addClass( "ui-state-error" );
// 			updateTips( n );
// 			return false;
// 		} else {
// 			return true;
// 		}
// 	}
// 	
// 	$( "#dialog-form" ).dialog({
// 		autoOpen: false,
// 		height: 300,
// 		width: 350,
// 		modal: true,
// 		buttons: {
// 			
// 			"Edit": function() {
// 				var bValid = true;
// 				allFields.removeClass( "ui-state-error");
// 				
// 				bValid = bValid && checkLength( email, "email", 6, 80 );
// 				bValid = bValid && checkLength( password, "password", 5, 16 );
// 				
// 				bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20 |\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
// 				bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
// 			
// 				if ( bValid ) {
// 					$( "#users tbody" ).append( "<tr>" +
// 						"<td>" + name.val() + "</td>" + 
// 						"<td>" + email.val() + "</td>" + 
// 						"<td>" + password.val() + "</td>" +
// 					"</tr>" ); 
// 					$( this ).dialog( "close" );
// 				}
// 			},
// 			Cancel: function() {
// 				$( this ).dialog( "close" );
// 			}
// 		},
// 		close: function() {
// 			allFields.val( "" ).removeClass( "ui-state-error" );
// 		}
// 	});
// 
// 	$( "#edit_user_account" )
// 		.button()
// 		.click(function() {
// 			$( "#dialog-form" ).dialog( "open" );
// 		});
// });
