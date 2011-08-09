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

      var input = document.getElementById('searchTextField');
      var input1 = document.getElementById('people_country_name');

      var autocomplete = new google.maps.places.Autocomplete(input);

      autocomplete.bindTo('bounds', map);
      var infowindow = new google.maps.InfoWindow();
      var marker = new google.maps.Marker({
        map: map
      });

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        infowindow.close();
        var place = autocomplete.getPlace();
        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }
        var image = new google.maps.MarkerImage(
            place.icon, new google.maps.Size(71, 71),
            new google.maps.Point(0, 0), new google.maps.Point(17, 34),
            new google.maps.Size(35, 35));
        marker.setIcon(image);
        marker.setPosition(place.geometry.location);

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] &&
             place.address_components[0].short_name || ''),
            (place.address_components[1] &&
             place.address_components[1].short_name || ''),
            (place.address_components[2] &&
             place.address_components[2].short_name || '')].join(' ');
        }

        infowindow.setContent('<div><b>Dhepthi Stays in <b>' + place.name + '</b><br>' + address);
        infowindow.open(map, marker);
      });
 function autoFill()
 {
     alert("changed");
 }