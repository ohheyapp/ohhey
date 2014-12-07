// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('.missed-connection').click(function(event) {
    event.preventDefault();
    var missedConnectionId = $(this).data('missedConnectionId');
    var marker = $.grep(App.markers, function(e) {
      return e.missedConnectionId === missedConnectionId;
    })[0];
    var latitude = $(this).data('latitude')
    var longitude = $(this).data('longitude')
    var position = new google.maps.LatLng(latitude, longitude);
    google.maps.event.trigger(marker, 'click')
    App.map.panTo(position);
    App.map.setZoom(15);
  });

});
