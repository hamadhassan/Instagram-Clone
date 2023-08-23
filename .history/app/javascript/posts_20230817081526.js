$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    $.ajax({
      url:"/post/like/"+post_id,
      method: "GET",
      data: {

      })
      .done(function{

      })
    })
  });
});
