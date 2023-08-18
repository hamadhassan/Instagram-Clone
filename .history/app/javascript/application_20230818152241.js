// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(function(){
  $(".post-like").on("click",function(){

  $(".post-like").on("click",function(){
  });
    var post_id = $(this).data("id");

    $.ajax({
      url: "/likes/save_like/" + post_id,
      method: "GET"
    }).done(function(response){
      console.log(response);
    });
  });
});
