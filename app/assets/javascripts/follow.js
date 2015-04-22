$(document).ready(function() {

  $(".follow_link").click(function(event){
    event.preventDefault();
    $target = $(event.target);
    var originatorID = $target.data('originator-id');
    var targetID = $target.data('target-id');

    $.ajax({
      url: $target.attr('action'), // /greeting
      type: $target.attr('method'), // 'post'
      data: { "originator_id": originatorID, "target_id": targetID },
    }).done(function(response) {
      console.log(response);
    })
    .fail(function(err) {
      console.log("error:", err);
    })
    .always(function() {
      console.log("complete");
    });
  });



});