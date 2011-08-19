var myLatlng = new google.maps.LatLng(43.385337,-102.75574);
var map;
var markersArray = [];
var count =1 ;
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
        map: map,
        title: "Marker "+count
		        
    });
    markersArray.push(marker);
    saveMarker(marker);
    count = count + 1;
    google.maps.event.addListener(marker,'click',function(){
        deleteMarker(this);
    });
});

function deleteMarkers() {
    if (markersArray) {
        for (i in markersArray) {
            markersArray[i].setMap(null);
        }
        markersArray.length = 0;
    }
    $("#sample_map").data("button_click", true);
    removeAllMarkers();
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

function saveMarker(markerObject)
{

    $.ajax({
        type: 'GET',
        url: '/gmap/save_marker',
        data: {
            "markers" : {
                "marker_name" : markerObject.getTitle(),
                "latitude" : markerObject.getPosition().lat(),
                "longitude" : markerObject.getPosition().lng()
                }
            },
    dataType: 'json',
    success:function(response){
        alertUser(response.error_message);
    },
    error: function(xhr) {
        alert("Failure");
    }

    });

}

function deleteMarker(markerObject)
{
    var latitude, longitude;
    latitude = markerObject.getPosition().lat().toFixed(6);
    longitude = markerObject.getPosition().lng().toFixed(6);
  
    $.ajax({
        type: 'GET',
        url: '/gmap/delete_marker',
        data: {
            "latitude" : latitude,
            "longitude" : longitude
        },
        dataType: 'json',
        success:function(response){
            alertUser(response.error_message);
            markerObject.setMap(null);
            var index = $.inArray(markerObject,markersArray);
            markersArray.splice(index,1);
				      
        },
        error: function(xhr) {
            alert("Failure");
        }
    });

}

function removeAllMarkers()
{
    $.ajax({
        type: 'GET',
        url: '/gmap/delete_all_markers',
        data: {
            "button_click" : $("#sample_map").data("button_click")
        },
        dataType: 'json',
        success:function(response){
            alertUser(response.error_message);
				      
        },
        error: function(xhr) {
            alert("Failure");
        }
    });

}

