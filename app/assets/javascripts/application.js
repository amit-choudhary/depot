// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts,
// vendor/assets/javascripts, or vendor/assets/javascripts of plugins, if any,
// can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at
// the bottom of the compiled file.
//
// Read Sprockets README
// (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/effect-blind
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(function() {
$('.rating_section').change(function() {
  var productID = $(this).attr('data'),
      requestType = '',
      urlString = ''
      selectedValue = $(this).val();
  if ($(this).attr('data-rating') == undefined && selectedValue > 0 || $(this).attr('data-rating') == 0 && selectedValue > 0) {
    requestType = 'POST';
    urlString = '/products/' + productID + '/rating';
    $(this).attr('data-rating', selectedValue);
  } 
  else if(selectedValue > 0) {
    requestType = 'PUT';
    urlString = '/products/' + productID + '/rating';
    $(this).attr('data-rating', selectedValue)
  }
  else if(selectedValue == 0) {
    requestType = 'DELETE';
    urlString = '/products/' + productID + '/rating';
    $(this).attr('data-rating', selectedValue)
  }
  $.ajax({
    type: requestType,
    data: '&product_id=' + productID + '&value=' + selectedValue,
    url: urlString,
    cache: true,
  } ); 
} );
} )
