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
        $(this).css("visibility", "hidden");
        $("#logo").css("visibility", "hidden");
        $("#signup_but").css("visibility", "hidden");
        $("#login_but").css("visibility", "hidden");
        $("#search_but").css("visibility", "hidden");
        $("#title").css("visibility", "hidden");
        $("#goer").css("visibility", "hidden");
        $("#search").css("visibility", "hidden");
    });

    $("#ex3").click(function(){
        $("#user_show").css("left", "80em");
        $("#menu").css("visibility", "visible");
        $("#logo").css("visibility", "visible");
        $("#signup_but").css("visibility", "visible");
        $("#login_but").css("visibility", "visible");
        $("#search_but").css("visibility", "visible");
        $("#title").css("visibility", "visible");
        $("#goer").css("visibility", "visible");
        $("#search").css("visibility", "visible");
    });
});

$(document).ready(function() {

    $("#straight").click(function(){
        $(".one_vid").toggleClass("spread");
        
    });

     $("#many").click(function(){
        $(".spread").toggleClass("one_vid");
    });

});
