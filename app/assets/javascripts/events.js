$(document).ready(function() {
    //TODO: organize click binding

    $("#addComment").click(function() {
        console.log("ADD!!");
       comment = $("#newComment").val();
       user = 1; // for now
        event = $("#eventContainer").data('event-id');
        console.log(comment);
        console.log(event);
        var commentData = {
            event_id: parseInt(event),
            message: comment,
            user_id: parseInt(user),
            date:new Date($.now())
        }

        $.post("/comments",
        {
            comment : commentData
            // dataType: 'json',
            // contentType: "application/json",
            // Accept:"application/json"
        },
        function(data, status){
            $("#newComment").val("");
            // TODO: clean this mess
            var newComment = '<div class="card commentContainer" data-comment-id="'+data.id+'">' +
                '  <div class="card-header">' +
                '    <a id="logo" href="/"><img height="50" width="50" class="rounded-circle" src=""></a>' +
                '    <button type="button" class="close closeBtn" aria-label="Close">' +
                '      <span aria-hidden="true">×</span>' +
                '    </button>' +
                '    <span> 1 </span>' +
                '  </div>' +
                '  <div class="card-body">' +
                '    <p class="card-text">'+data.message+'</p>' +
                '    <p class="font-weight-light">'+data.date+'</p>' +
                '  </div>' +
                '</div>';
            $("#commentsContainer").append(newComment);
        });
    });

    $(".closeBtn").click(function() {
        comment_id = $(this).parents(".commentContainer").data('comment-id');
        console.log(comment_id);
        // TODO: modify controller to send back json
        // TODO: update the events page
        $.ajax({
            url: '/comments/'+comment_id,
            type: 'DELETE',
            success: function(result) {
                console.log(result);
            }
        });
    });

    $(".eventContainer").click(function(){
        // TODO: check if this is the right way
        event_id = $(this).data('event-id');
        document.location.href = '/events/'+event_id;
        // $.ajax({
        //     url: '/events/'+event_id,
        //     type: 'GET',
        //     success: function(result) {
        //         console.log(result);
        //     }
        // });
    });
})