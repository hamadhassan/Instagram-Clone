$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    var post_id= $
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
