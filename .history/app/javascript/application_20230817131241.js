// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    var post_id= $(this).data("id");

    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET"
      })
  })
});
