$(document).ready(function(){
  $("button.add, button.delete, button.define").click(function(e){
    formGroup = $(this).siblings(".form-group")
    rowGroup = $(this).parents("row")
    var userInputHomePage = formGroup.find("input").val();
    var userInputWordPage = rowGroup.find("input").val();
    if (userInputHomePage === "" || userInputWordPage === ""){
      e.preventDefault();
      formGroup.addClass("has-error");
      rowGroup.addClass("has-error");
      $("div.error").removeClass("hide");
      return;
    }
  });
});
