// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var App = {
  missedConnections: [],
  baseUrl: '/api/v1/missed_connections/',

  initialize: function() {
    var missedConnectionParam = window.location.pathname.match(/missed_connections\/(\d*)/);
    var mapOptions = {
      zoom: 12,
      center: new google.maps.LatLng(40.706709, -73.923516)
    };

    App.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    if (missedConnectionParam != null) {
      var url = App.baseUrl + missedConnectionParam[1];
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
      missedConnection.marker = new google.maps.Marker({
        map: App.map,
        position: new google.maps.LatLng(missedConnection.latitude, missedConnection.longitude),
        infoWindow: new google.maps.InfoWindow(),
      });
      App.missedConnections.push(missedConnection);

      App.addMissedConnectionLinkEvent();
      App.addMarkerClickEvent(missedConnection);
      App.addInfoWindowCloseClickEvent(missedConnection);

      if (missedConnections.length === 1) {
        App.setBoundsOfSingleMarker(missedConnection.marker);
      }
    }
  },

  moveToMarker: function(marker) {
    App.map.panTo(marker.position);
    App.map.setZoom(15);
  },

  setActiveMissedConnection: function(missedConnection) {
    App.removeActiveMissedConnection();
    $('.missed-connection[data-missed-connection-id="' + missedConnection.id + '"]').addClass('active');
  },

  removeActiveMissedConnection: function() {
    $('.missed-connection[data-missed-connection-id]').removeClass('active');
  },

  closeAllInfoWindows: function() {
    for (i = 0; i < App.missedConnections.length; i++) {
      App.missedConnections[i].marker.infoWindow.close();
    }
  },

  addMissedConnectionLinkEvent: function() {
    $('.missed-connection').click(function(event) {
      event.preventDefault();
      var missedConnectionId = $(this).data('missedConnectionId');
      var missedConnection = $.grep(App.missedConnections, function(e) {
        return e.id === missedConnectionId;
      })[0];
      google.maps.event.trigger(missedConnection.marker, 'click');
    });
  },

  addMarkerClickEvent: function(missedConnection) {
    google.maps.event.addListener(missedConnection.marker, 'click', (function(missedConnection) {
      return function() {
        App.closeAllInfoWindows();
        App.setActiveMissedConnection(missedConnection);
        missedConnection.marker.infoWindow.setContent(
          '<h4>' + missedConnection.title + '</h4>' + "\n" +
          '<p>' + missedConnection.body + '</p><br>' + "\n" +
          '<a href="' + window.location.origin + missedConnection.verification_path + '">' + "That's Me!" + '</a>'
        )
        missedConnection.marker.infoWindow.open(App.map, missedConnection.marker);
        App.moveToMarker(missedConnection.marker);
      }
    })(missedConnection));
  },

  addInfoWindowCloseClickEvent: function(missedConnection) {
    google.maps.event.addListener(missedConnection.marker.infoWindow, 'closeclick', (function() {
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
