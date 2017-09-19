$(document).ready(function(){
  $("button.add, button.delete, button.define, button.photo, button.search_word").click(function(e){
    formGroup = $(this).parents().siblings(".form-group")
    var userInput = formGroup.find("input").val();

    if (userInput === ""){
      e.preventDefault();
      formGroup.addClass("has-error");
      $("div.error").removeClass("hide");
      return;
    }
  });

  $("button.search").click(function(e){
    e.preventDefault();
    $(".search_container").removeClass("hide");
  })
});
