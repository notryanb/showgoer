$(document).ready(function() {
$(".post_com").click(function(event){
    event.preventDefault();
    $(".the_new_form").toggle();
    }); //create_button ending

   // AJAX call for posting new comment
   $(".the_new_form").submit(function(event){
    event.preventDefault();
    $target = $(event.target);
    // var form = this;
    // var commentvideoID = $('#comment_video_id').data('videoId');
    // var commentuserID = $('#comment_user_id').data('userId');
    // var commentconcertID = $('#comment_concert_id').data('concertId');
    // console.log(commentvideoID);
    // console.log(commentuserID);
    // console.log(commentconcertID);
    console.log($target.serialize());
    $.ajax({
      url: "../comments", // /greeting
      type: "POST", // 'post'
      // data: { "video_id": commentvideoID, "user_id": commentuserID, "concert_id": commentconcertID },
      data: $target.serialize(),
      dataType: 'json'
    }).done(function(response) {
      console.log(response);
      // $('.comments').append(response);
      form.reset(); // clear form
    })
    .fail(function(err) {
      console.log("error:", err);
    })
    .always(function() {
      console.log("complete");
    });
  });

   }); //ends the documant.ready