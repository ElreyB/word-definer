$(document).ready(function(){
  $("button.add, button.delete, button.define, button.photo").click(function(e){
    formGroup = $(this).parents().siblings(".form-group")
    var userInput = formGroup.find("input").val();

    if (userInput === ""){
      e.preventDefault();
      formGroup.addClass("has-error");
      $("div.error").removeClass("hide");
      return;
    }
  });
});
