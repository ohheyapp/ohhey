// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var map;

function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(40.7100474, -73.9263586)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);
