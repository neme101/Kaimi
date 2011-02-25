window.addEvent('domready',function(){
    (function() {
        var geocoder
        var map;
        if(map_canvas = $('map_canvas')){
            geocoder = new google.maps.Geocoder();
            var myLatlng = new google.maps.LatLng(-34.883, -56.181);
            var myOptions = {
              zoom: 11,
              center: myLatlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(map_canvas, myOptions);
            
            google.maps.event.addListener(map, 'click', function(event) {
                placeMarker(event.latLng);
              });
            
            var marker;
            function placeMarker(location) {
                if(!marker){
                    marker = new google.maps.Marker({
                        position: location, 
                        map: map,
                        draggable: true
                    });
                    $('latitude').set('value',marker.getPosition().lat());
                    $('longitude').set('value',marker.getPosition().lng());
                    google.maps.event.addListener(marker, 'dragend', function(event) {
                        $('latitude').set('value',marker.getPosition().lat());
                        $('longitude').set('value',marker.getPosition().lng());
                    });
                }
            }
            
            function codeAddress() {
                var address = $("address").value;
                var bounds = map.getBounds();
                geocoder.geocode( { 'address': address, 'region': 'uy', 'bounds': bounds}, function(results, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    if(!marker) {
                        placeMarker(results[0].geometry.location);
                        $('latitude').set('value',marker.getPosition().lat());
                        $('longitude').set('value',marker.getPosition().lng());
                    } else {
                        marker.setPosition(results[0].geometry.location);
                        $('latitude').set('value',marker.getPosition().lat());
                        $('longitude').set('value',marker.getPosition().lng());
                    }
                  } else {
                    alert("Geocode was not successful for the following reason: " + status);
                  }
                });
            }
            
            $('address').addEvent('change',function(){
                codeAddress();
            });
        }
    })();
});
