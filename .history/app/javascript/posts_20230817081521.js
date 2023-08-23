$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    $.ajax({
      url:"/post/like/",
      method: "GET",
      data: {

      })
      .done(function{

      })
    })
  });
});
