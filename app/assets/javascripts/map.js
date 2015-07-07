mapInitializer = function(position) {
  var curLatLng    = new google.maps.LatLng(position.coords.latitude,
                                            position.coords.longitude),
      mapOptions   = {zoom: 8, center: curLatLng},
      mapContainer = document.getElementById('map-canvas'),
      map, request
  ;

  if (!!mapContainer) {
    map     = new google.maps.Map(mapContainer, mapOptions);
    request = $.getJSON("/api/v1/groups");

    request.done(function (data) {
      $.each(data, function(){
        var marker = new google.maps.Marker({
          position :new google.maps.LatLng(this.data.latitude,this.data.longitude),
          map      :map,
          icon     :mapContainer.getAttribute("data-marker-image"),
          title    :this.name,
          data     :this
        });

        google.maps.event.addListener(marker, "click", function () {
          window.location.pathname = this.data.links.self;
        });
      });
    });
  }

};

$("body").ready(function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(mapInitializer);
  } else {
    error('not supported');
  }
});
