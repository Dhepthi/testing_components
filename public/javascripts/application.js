// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


 jQuery.ajaxSetup({
   'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
 });
 
$(document).ready(function (){

//   $('#country_submit').click(function (){
//        $.post($(this).attr('value'), $(this).serialize(), null, "script");
//        return false;
//    });
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
$("#new_user").click(function(){
   alert("Need to add path");
});

});
