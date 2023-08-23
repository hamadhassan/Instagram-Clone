$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    $.ajax({
      url:"/post",
      method: "GET",
      data: {

      })
      .done(function{

      })
    })
  });
});
