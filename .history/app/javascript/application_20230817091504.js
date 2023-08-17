// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


console.log("this is ")
$(function(){
  //jquery loaded
  $(".post-like").on("click",function(){
    var post_id= $(this).data("id");
    $.ajax({
      url:"/post/like/"+post_id,
      method: "GET"
        }).done(function(response){
          console.log(response);
    });
  });
});
