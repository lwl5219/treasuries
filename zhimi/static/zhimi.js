
$(document).ready(function() {
    $("iframe").get(0).remove();
    $("#handout").click(function() {
        $(".phrase").slideToggle();
        $(".analysis").slideToggle();
        $(".zh_ctx").slideToggle();
        $(".grammar").slideToggle();
        $(".handout").slideToggle();
        $("blockquote").slideToggle();
    });
});

