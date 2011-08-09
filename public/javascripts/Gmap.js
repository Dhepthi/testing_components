 var myLatlng = new google.maps.LatLng(43.385337,-102.75574);
 var map;
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

   
