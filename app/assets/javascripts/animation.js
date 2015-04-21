$(document).ready(function() {

    $("#menu").hover(function(){
        $(".line").css("margin-top", ".8em");
    }, function() {
      $(".line").css("margin-top", ".4em");
    });
});

$(document).ready(function() {

    $("#ex1").click(function(){
        $(".signin").toggle();
         $("#signup_but").css("visibility", "visible");
        
    });

     $("#ex2").click(function(){
        $(".signup").toggle();
        $("#login_but").css("visibility", "visible");
    });

});

$(document).ready(function() {

    $("#menu").click(function(){
        $("#user_show").css("left", "10em");
    });

    $("#ex3").click(function(){
        $("#user_show").css("left", "83em");
    });
});

$(document).ready(function() {

    $(".straight").click(function(){
        $(".one_vid").toggleClass("spread");
        
    });

     $("#many").click(function(){
        $(".spread").toggleClass("one_vid");
    });

});
