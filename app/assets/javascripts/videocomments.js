$(document).ready(function() {
$(".post_com").click(function(event){
    event.preventDefault();
    $(".the_new_form").toggle();
    }); //create_button ending

   // AJAX call for posting new comment
   $(".the_new_form").submit(function(event){
    event.preventDefault(); 
    $target = $(event.target); 
    var form = this;
    console.log("VIDEOID: "+ videoID);
    $.ajax({
      url: "/comments", // /greeting
      type: "POST", // 'post'
      data: $target.serialize(),
      dataType: 'json'
    }).done(function(response) {
      $('.comments'+response.video_id).append(response.content);
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