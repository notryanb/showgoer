$(document).ready(function() {

    $(".signin_button").click(function(){
        $(".signin").toggle();
        $("#signup_but").css("visibility", "hidden");
    });

     $(".signup_button").click(function(){
        $(".signup").toggle();
        $("#login_but").css("visibility", "hidden");
    });

});