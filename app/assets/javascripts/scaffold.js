var scaffold = function scaffold () {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-purple',
    radioClass: 'iradio_square-purple',
    increaseArea: '20%' // optional
  });

  $("[data-geocomplete]").geocomplete({
    details          :"form",
    detailsAttribute :'data-geo'
  });

  $(".select2").select2();

  (function($el){
    if (!$el) { return; }

    var latitude    = $el.attr("data-latitude"),
        longitude   = $el.attr("data-longitude"),
        myLatlng    = new google.maps.LatLng(latitude,longitude);
        mapOptions  = {
          zoom    :16,
          center  :myLatlng
        }
    ;

    var map = new google.maps.Map($el[0], mapOptions);

    var marker = new google.maps.Marker({
      position :myLatlng,
      map      :map,
      icon     :"/assets/poker.png",
      title    :"Yay!"
  });
  })($("#group-map-canvas"));
}

$("body").ready(scaffold);
