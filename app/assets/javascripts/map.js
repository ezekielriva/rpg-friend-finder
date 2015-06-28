(function (window) {
  window.mapInitializer = function initialize() {
    var mapOptions = {
      zoom: 8,
      center: new google.maps.LatLng(-34.397, 150.644)
    };

    var mapContainer = document.getElementById('map-canvas');

    if (mapContainer) {
      var map = new google.maps.Map(mapContainer, mapOptions);
    }

  };
})(window);
