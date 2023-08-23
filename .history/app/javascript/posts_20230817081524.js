$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    $.ajax({
      url:"/post/like/"+pos,
      method: "GET",
      data: {

      })
      .done(function{

      })
    })
  });
});
