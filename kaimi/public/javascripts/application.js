window.addEvent('domready',function(){
    function initialize() {
        var myLatlng = new google.maps.LatLng(-34.883611, -56.181944);
        var myOptions = {
            zoom: 8        }
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    }
    initialize();
});
