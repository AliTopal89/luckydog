$(document).ready(function(){
$(function togglePswdConf(){
  $('input[id="user_password"], input[id="user_password_confirmation"').each(function(index, input){
    var $input = $(input);
    var css = 'relative btn p1 h6';
    var el = `<button type="button" id="pw-toggle" class="${css}">Show</button>`;
    $(el).click(function () {
      var change = "";
      if ($(this).html() === "Show") {
        $(this).html("Hide")
        change = "text";
      } else {
        $(this).html("Show");
        change = "pw-toggle"
      }
      var toggle = $("<input type='" + change + "' />")
        .attr("id", $input.attr("id"))
        .attr("name", $input.attr("name"))
        .attr('class', $input.attr('class'))
        .val($input.val())
        .insertBefore($input)
      $input.remove();
      $input = toggle;
    }).insertAfter($input);
  });
});
})