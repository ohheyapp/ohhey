// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('.missed-connection').click(function(event) {
    event.preventDefault();
    var missedConnectionId = $(this).data('missed-connection-id');
    var marker = markers[missedConnectionId - 1];
    var latitude = $(this).data('latitude')
    var longitude = $(this).data('longitude')
    var position = new google.maps.LatLng(latitude, longitude);
    google.maps.event.trigger(marker, 'click')
    map.panTo(position);
    map.setZoom(15);
  });
});
