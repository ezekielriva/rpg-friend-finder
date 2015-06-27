(function (window) {
  window.mapInitializer = function initialize() {
    var mapOptions = {
      zoom: 8,
      center: new google.maps.LatLng(-34.397, 150.644)
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
  };

  function loadGMapScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBFAxUiVg13Fx07MTBKto0Qk0u9PS6vKWE&v=3.exp' +
        '&signed_in=true&callback=mapInitializer';
    document.body.appendChild(script);
  };

  window.onload = loadGMapScript;
})(window);
