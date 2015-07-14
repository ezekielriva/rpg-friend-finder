mapInitializer = function(position) {
  var mapContainer = document.getElementById('map-canvas'), map, request;

  if (!!mapContainer) {
    window.map = new MapBuilder({ mapContainer: mapContainer });
    window.map.build();
    window.map.centerAt(position.coords);

    $("[data-behavior=FilterMap]:first").click();

  }
};

$("body").ready(function () {
  $("[data-behavior=FilterMap]").on("click", function (e) {
    loadMarkers(this.getAttribute("data-scope"), {icon: this.getAttribute("data-marker-image")});
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(mapInitializer);
  } else {
    error('not supported');
  }
});

function loadMarkers(url, options) {
  var request = $.getJSON(url);

  request.done(function (data) {
    window.map.cleanMarkers();
    $.each(data, function(){
      window.map.addMarker(this, options);
    });
  });
}
