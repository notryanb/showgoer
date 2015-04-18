$(document).ready(function() {

    $("ul").hover(function(){
        $(".line").css("margin-top", ".8em");
    }, function() {
      $(".line").css("margin-top", ".4em");
    });
});