"use strict";

$(document).ready(function(){


  // Like Button Ajax
  $('.like-btn').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.attr("disabled", true);
    var userID = $target.data('user-id');
    var videoID = $target.data('video-id');

    $.ajax({
      url: '/likes',
      method: 'POST',
      data: { "user_id": userID, "video_id": videoID }
    }).done(function(response){
      $('.likes-vote-count' + videoID).html(response);
    }).fail(function(err){
      console.log("Error" + err)
    });
    
  });


  // Disike Button Ajax
  $('.dislike-btn').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $target.attr("disabled", true);
    var userID = $target.data('user-id');
    var videoID = $target.data('video-id');

    $.ajax({
      url: '/dislikes',
      method: 'POST',
      data: { "user_id": userID, "video_id": videoID }
    }).done(function(response){
      $('.dislikes-vote-count' + videoID).html(response);
    }).fail(function(err){
      console.log("Error" + err)
    });
    
  });




});