// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var App = {
  markers: [],
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
      }
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
        longitude: missedConnection.longitude,
        infoWindow: new google.maps.InfoWindow(),
      });
      App.markers.push(marker);

      App.addMissedConnectionLinkEvent();
      App.addMarkerClickEvent(marker, missedConnections);
      App.addInfoWindowCloseClickEvent(marker);

      if (missedConnections.length === 1) {
        App.setBoundsOfSingleMarker(marker);
      }
    }
  },

  moveToMarker: function(marker) {
    App.map.panTo(marker.position);
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
    for (i = 0; i < App.markers.length; i++) {
      App.markers[i].infoWindow.close();
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

  addMarkerClickEvent: function(marker, missedConnections) {
    google.maps.event.addListener(marker, 'click', (function(marker) {
      return function() {
        var missedConnection = $.grep(missedConnections, function(e) {
          return e.id === marker.missedConnectionId;
        })[0];
        App.closeAllInfoWindows();
        App.setActiveMissedConnection(marker);
        marker.infoWindow.setContent(missedConnection.info_window_content);
        marker.infoWindow.open(App.map, marker);
        App.moveToMarker(marker);
      }
    })(marker));
  },

  addInfoWindowCloseClickEvent: function(marker) {
    google.maps.event.addListener(marker.infoWindow, 'closeclick', (function() {
      return function() {
        App.removeActiveMissedConnection();
      }
    })());
  },

  setBoundsOfSingleMarker: function(marker) {
    google.maps.event.trigger(marker, 'click');
    App.map.setZoom(17);
  }
}

google.maps.event.addDomListener(window, 'load', App.initialize);
