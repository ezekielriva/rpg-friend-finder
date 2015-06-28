mapInitializer = function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };

  var mapContainer = document.getElementById('map-canvas');

  if (!!mapContainer) {
    var map = new google.maps.Map(mapContainer, mapOptions);
    var request = $.getJSON("/api/v1/groups");
    request.done(function (data) {
      $.each(data, function(){
        var marker = new google.maps.Marker({
          position :new google.maps.LatLng(this.data.latitude,this.data.longitude),
          map      :map,
          icon     :"/assets/poker.png",
          title    :this.name,
          data     :this
        });

        google.maps.event.addListener(marker, "click", function () {
          window.location.pathname = this.data.links.self;
        })
      });
    });
  }

};

$("body").ready(mapInitializer);
