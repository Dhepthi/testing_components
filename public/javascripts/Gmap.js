 var myLatlng = new google.maps.LatLng(43.385337,-102.75574);
 var map;
 var markersArray = [];
    var myOptions = {
        zoom: 3, // set the zoom level
        center: myLatlng,  // set the map centre Lat and Long
        scrollwheel: true, // scroll wheel aided zooming
        zoomControl: !(/iPad/i.test(navigator.userAgent)),
        disableDefaultUI: true, //Enables/disables all default UI. May be overridden  individually.
        draggable: true, //If false, prevents the map from being dragged. Dragging is enabled by default.
        mapTypeId: google.maps.MapTypeId.HYBRID, //The initial Map mapTypeId. Required. - HYBRID, ROADMAP, SATELLITE, TERRAIN
        navigationControl: true,
        navigationControlOptions: {
            style: google.maps.NavigationControlStyle.SMALL
        }
    }

    map = new google.maps.Map(document.getElementById("sample_map"), myOptions);

    google.maps.event.addListenerOnce(map, "resize", function() { });
    map.setCenter(myLatlng);
    google.maps.event.addListener(map,'click', function(e){ 
	 var  marker = new google.maps.Marker({
		        position: e.latLng,
		        flat:true,
		        map: map
		        
		    });
           markersArray.push(marker);
    });

    function deleteMarkers() {
            if (markersArray) {
                for (i in markersArray) {
                    markersArray[i].setMap(null);
                }
                markersArray.length = 0;
            }
        }

        function clearMarkersArray() {
            if (markersArray) {
                for (i in markersArray) {
                    markersArray[i].setMap(null);
                }
            }
        }

	 function showMarkersArray() {
		    if (markersArray) {
		        for (i in markersArray) {
		            markersArray[i].setMap(map);
		        }
		    }
		}

$(document).ready(function (){
$("#google_form").find("#storing").click(function(){
alert("Please click on Map to create Marker");
$.ajax({
            type: 'POST',
            url: '/peoples/save_markers',
            data: {"markers" : { "marker_name" : "Marker1", "latitude" : 12.33333, "longitude" : 13.555555 }},
            dataType: 'json',
            success:function(response){

alert(response.error_message);
    
 },
error: function(xhr) {
alert("Failure");
}

});
});
});
