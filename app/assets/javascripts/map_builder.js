var MapBuilder = (function (GoogleMaps) {

  function defaultMapBuilder() {
    return { zoom: 8 };
  };

  var MapBuilder = function (options) {
    this.mapContainer  = options.mapContainer;
    this.mapOptions    = options.mapOptions || defaultMapBuilder();
    this.latitude      = options.latitude;
    this.longitude     = options.longitude;
    this.markers       = [];
  };

  MapBuilder.prototype.build = function () {
    this.map = new GoogleMaps.Map(this.mapContainer, this.mapOptions);
  };

  MapBuilder.prototype.cleanMarkers = function () {
    this.markers.forEach(function (current, index, array) {
      current.setMap(null);
    })
    this.markers.length = 0;
  };

  MapBuilder.prototype.addMarker = function (response, options) {
    var marker = new GoogleMaps.Marker({
      position :new GoogleMaps.LatLng(response.data.latitude, response.data.longitude),
      map      :this.map,
      icon     :response.data.avatar || options.icon,
      title    :response.data.name,
      data     :response
    });

    GoogleMaps.event.addListener(marker, "click", function () {
      window.location.pathname = this.data.links.self;
    });

    this.markers.push(marker);
  };

  MapBuilder.prototype.centerAt = function (coords) {
    var position   = new GoogleMaps.LatLng(coords.latitude, coords.longitude);
    this.latitude  = coords.latitude;
    this.longitude = coords.longitude;
    this.map.setCenter(position);
  };

  return MapBuilder
})(google.maps);
