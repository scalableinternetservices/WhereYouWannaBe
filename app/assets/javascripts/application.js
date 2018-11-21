// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery-ui

$(document).on('turbolinks:load', function() {

    // event attendee; used by /event and /home
    $(".attnedEvent").click(function(event) {
        event_id = $(event.target).parents(".eventBody").data("event-id");
        $("#my-modal").modal();
        $("#my-modal").data("event-id", event_id);
    });

    $("#createAttendee").click(function(event) {
        event_id = $("#my-modal").data("event-id");
        console.log("check me!");
        console.log(event_id);
        user_id = $("#eventIndex").data("user-id");
        guests_count = $("#guests_count").val();
        console.log("HERE");
        //console.log(event_id);
        console.log(user_id);
        console.log(guests_count);
        var attendeeData = {
            event_id: event_id,
            user_id: user_id,
            guests_count: guests_count,
            updated_at: new Date($.now())
        }
        $.post("/attendees",
            {
                attendee: attendeeData
                // dataType: 'json',
                // contentType: "application/json",
                // Accept:"application/json"
            }, function (result) {
                console.log(result);
            });
    });
});
