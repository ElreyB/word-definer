$(document).ready(function(){
  $("button.add, button.delete, button.define").click(function(e){
    formGroup = $(this).siblings(".form-group")
    var userInput = formGroup.find("input").val();

    if (userInput === ""){
      e.preventDefault();
      formGroup.addClass("has-error");
      $("div.error").removeClass("hide");
      return;
    }
  });
});
