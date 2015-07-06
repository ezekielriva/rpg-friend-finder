window.fbAsyncInit = function() {
  var PRODUCTION_ID   = "834500276634652",
      DEVELOPMENT_ID  = "834921849925828"
      appID           = (location.href.match("localhost") === null) ? PRODUCTION_ID : DEVELOPMENT_ID
 ;
 
  FB.init({
    appId      : appID,
    xfbml      : true,
    version    : 'v2.3'
  });
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));
