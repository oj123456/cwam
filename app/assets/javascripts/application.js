// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ./slick
//= require ./readmore.min
//= require ./main
//= require_tree .

$(document).ready(function () {
    $("[is-auto-complete=1]").on("keyup", function () {
        var value = $(this).val();
        var resultHtml = "";
        if (value.length > 3){
            $.ajax('/recipe/autofill_search', {
                data: {title: value},
                method: 'GET',
                success: function(result){
                    var details_url = $("meta[name=recipe-details-url]").attr("content");
                    result.forEach(function (item) {
                        resultHtml += "<div class='entry'><a href='" + details_url + item.slug + "'>" + item.title +"</a></div>";
                    });
                    $($(".box-body")[0]).html(resultHtml);
                }
            });
        }else {
            $($(".box-body")[0]).html('');
        }
    })
})