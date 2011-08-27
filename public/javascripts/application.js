// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({
    'beforeSend': function (xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
        }
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
                $('#people_country_name').autocomplete({
                    source:autocompleteData
                });
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
        $("#tabs").data("RspecName", "peoples");
        $("#tabs").data("CapybaraName", "people");
        $('#tabs').tabs( "option", "selected", 0 );
        loadSpecAndCapybaracode();
    });

    $(".google_map").click(function(){
        $("#ajax_feature").css("display","none");
        $("#new_people_form").css("display","none");
        $("#google_form").css("display","block");
        $("#tabs").data("RspecName", "gmap");
        $("#tabs").data("CapybaraName", "map");
        google.maps.event.trigger(map, 'resize');
        $("#sample_map").data("button_click", false);
        removeAllMarkers
        $('#tabs').tabs( "option", "selected", 0 );
        loadSpecAndCapybaracode();
    });

    $(".ajax_feature").click(function(){
        $("#ajax_feature").css("display","block");
        $("#google_form").css("display","none");
        $("#new_people_form").css("display","none");
        $("#tabs").data("RspecName", "countries");
        $("#tabs").data("CapybaraName", "country");
        $('#tabs').tabs( "option", "selected", 0 );
        loadSpecAndCapybaracode();
    });

});


function loadSpecAndCapybaracode()
{
    $.ajax({
        type: 'post',
        url: '/peoples/get_rspec_and_capybara_code',
        data: {
            "rspec_name" : $("#tabs").data("RspecName"),
            "capybara_name":$("#tabs").data("CapybaraName")
        },
        dataType: 'json',
        success:function(response){
            $("#tabs").find("#tabs-2").empty();
            $("#tabs").find("#tabs-3").empty();
            $("#tabs").find("#tabs-2").append("<pre id='rspec' style='overflow:auto;'>"+response["rspec_code"]+"</pre>");
            $("#tabs").find("#tabs-3").append("<pre id='capybara' style='overflow:auto;'>"+response["capybara_code"]+"</pre>");
             
        }
    });
}

function storeMarkers()
{
    alertUser("Please click on Map to create & save Marker");
}

function load_content_for_tabs(content)
{
    $("#tabs").find("#tabs-2").append(content);
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