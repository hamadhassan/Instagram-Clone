// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(function(){
  $(".post-comment").on("click",function(){
    $("comment_comment").focus();
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
  // Assuming your registration form has the ID 'registration-form'
  $('#registration-form').on('submit', function() {
    // Clear form fields
    $(this).find('input[type=text], input[type=email], input[type=password]').val('');
  });
});
</script>

});
