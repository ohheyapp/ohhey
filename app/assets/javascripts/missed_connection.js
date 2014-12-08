// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var App = {
  markers: [],
  infoWindows: [],
  baseUrl: '/api/v1/missed_connections/',

  initialize: function() {
    var missedConnectionParam = window.location.pathname.split('/')[2];
    var mapOptions = {
      zoom: 14,
      center: new google.maps.LatLng(40.706709, -73.923516)
    };

    App.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    if (typeof missedConnectionParam != "undefined") {
      var url = App.baseUrl + missedConnectionParam;
    } else {
      var url = App.baseUrl;
    }

    $.ajax({
      url: url,
      success: function(data) {
        var missedConnections = $.makeArray(data.missed_connections);
        App.addMarkers(missedConnections);
      },
    });
  },

  addMarkers: function(missedConnections) {
    for (i = 0; i < missedConnections.length; i++) {
      var missedConnection = missedConnections[i];
      var position = new google.maps.LatLng(missedConnection.latitude, missedConnection.longitude);
      var marker = new google.maps.Marker({
        position: position,
        map: App.map,
        title: missedConnection.title,
        missedConnectionId: missedConnection.id,
        latitude: missedConnection.latitude,
        longitude: missedConnection.longitude
      });
      var infoWindow = new google.maps.InfoWindow(), marker;

      App.markers.push(marker);
      App.infoWindows.push(infoWindow);

      App.addMissedConnectionLinkEvent();
      App.addMarkerClickEvent(marker, infoWindow, missedConnections);
      App.addInfoWindowCloseClickEvent(infoWindow);

      if (missedConnections.length === 1) {
        App.setBoundsOfSingleMarker(marker);
      }
    }
  },

  moveToMarker: function(marker) {
    var position = new google.maps.LatLng(marker.latitude, marker.longitude);
    App.map.panTo(position);
    App.map.setZoom(15);
  },

  setActiveMissedConnection: function(marker) {
    App.removeActiveMissedConnection();
    $('.missed-connection[data-missed-connection-id="' + marker.missedConnectionId + '"]').addClass('active');
  },

  removeActiveMissedConnection: function() {
    $('.missed-connection[data-missed-connection-id]').removeClass('active');
  },

  closeAllInfoWindows: function() {
    for (i = 0; i < App.infoWindows.length; i++) {
      App.infoWindows[i].close();
    }
  },

  addMissedConnectionLinkEvent: function() {
    $('.missed-connection').click(function(event) {
      event.preventDefault();
      var missedConnectionId = $(this).data('missedConnectionId');
      var marker = $.grep(App.markers, function(e) {
        return e.missedConnectionId === missedConnectionId;
      })[0];
      google.maps.event.trigger(marker, 'click');
    });
  },

  addMarkerClickEvent: function(marker, infoWindow, missedConnections) {
    google.maps.event.addListener(marker, 'click', (function(marker) {
      return function() {
        var missedConnection = $.grep(missedConnections, function(e) {
          return e.id === marker.missedConnectionId;
        })[0];
        App.closeAllInfoWindows();
        App.setActiveMissedConnection(marker);
        App.moveToMarker(marker);
        infoWindow.setContent(missedConnection.info_window_content);
        infoWindow.open(App.map, marker);
      }
    })(marker));
  },

  addInfoWindowCloseClickEvent: function(infoWindow) {
    google.maps.event.addListener(infoWindow, 'closeclick', (function() {
      return function() {
        App.removeActiveMissedConnection();
      }
    })());
  },

  setBoundsOfSingleMarker: function(marker) {
    google.maps.event.trigger(marker, 'click');
  }
}

google.maps.event.addDomListener(window, 'load', App.initialize);
