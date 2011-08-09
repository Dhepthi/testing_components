// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


 jQuery.ajaxSetup({
   'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
 });
 
$(document).ready(function (){

    $('#new_country').submit(function (){
        $.post($(this).attr('action'), $(this).serialize(), null, "script");
        return false;
    });
    $('#people_country_name').val("");
    $('#people_address').focusout(function() {

    $.ajax({
            type: 'get',
            url: '/countries/get_countries_name',
            dataType: 'json',
            success:function(response){
                var autocompleteData=[];
                $.each(response,function(key,val){
                    $.each(val,function(name, value){
                        $.each(value,function(k, v){
                            autocompleteData.push(v);
                        })
                    })
                });
                $('#people_country_name').autocomplete({source:autocompleteData});
            }
        });
    });

$('#new_people').submit(function (){
        $.post($(this).attr('action'), $(this).serialize(), null, "script");
        return false;
    });

$(".auto_complete").click(function(){
 $("#ajax_feature").css("display","none");
 $("#google_form").css("display","none");
 $("#new_people_form").css("display","block");
});

$(".google_map").click(function(){
 $("#ajax_feature").css("display","none");
 $("#new_people_form").css("display","none");
 $("#google_form").css("display","block");
 google.maps.event.trigger(map, 'resize');
});

$(".ajax_feature").click(function(){
 $("#ajax_feature").css("display","block");
 $("#google_form").css("display","none");
 $("#new_people_form").css("display","none");
});

$("#google_form").find("#clearing").click(function(){
clearMarkersArray();
});

$("#google_form").find("#deletion").click(function(){
deleteMarkers();
});

$("#google_form").find("#showing").click(function(){
showMarkersArray();
});
$("#google_form").find("#storing").click(function(){
alert("Please click on Map to create Marker");
})
});

function load_content_for_tabs(content)
{
$("#tabs").find("#tabs-1").replaceWith(content);
}
function alertUser(message){
		var $alert = $('#alert');
		$alert.html(message);
		if ($alert.length) {
			var alerttimer = window.setTimeout(function(){
				$alert.trigger('click');
			},5000);
			$alert.animate({
				height: $alert.css('line-height') || '50px'
			}, 200).click(function(){
				window.clearTimeout(alerttimer);
				$alert.animate({
					height: '0'
				}, 200);
			});
		}
      $('#new_people')[0].reset();
	}

