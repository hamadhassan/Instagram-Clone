// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require bootstrap-sprockets
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

  $('#registration-form').on('submit', function() {
    $(this).find('input[type=text], input[type=email], input[type=password]').val('');
  });
  $('#image-upload-post').change(function() {
    var files = $(this)[0].files;
    if (files.length >= 10) {
      alert("You can only upload a maximum of 10 images.");
      $(this).val('');
    }
  });
    $('.carousel').carousel({ interval: false });

    // Add click event handlers for the next and previous buttons
    $('.carousel-control-prev').click(function (e) {
      e.preventDefault();
      $(this).closest('.carousel').carousel('prev');
    });

    $('.carousel-control-next').click(function (e) {
      e.preventDefault();
      $(this).closest('.carousel').carousel('next');
    });
    e.preventDefault();

    $(document).on('click', '.edit-comment-link', function(e) {
      e.preventDefault();

      var editLink = $(this);

      $.ajax({
        type: 'GET',
        url: editLink.attr('href'),
        dataType: 'html',
        success: function(response) {
          // Replace the link with the edit form
          editLink.replaceWith(response);
        }
      });
    });
});
