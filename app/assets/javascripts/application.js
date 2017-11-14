// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
// comments
$(document).ready(function() {
  $(document).on('submit', '.new_comment', function(e) {
    e.preventDefault();
    var target = e.target

    $.ajax(target.action, {
      method: 'POST',
      data: $(this).serialize()
    })
    .done(function(data) {
      $(target).find('#comment_text').val("");
      $(target).parent().parent().find('.comments').append(data);
    })
    .fail(function() {
      alert('failed to post comment');
    });
  });

  $(document).on('submit', '.edit_comment', function(e) {
    e.preventDefault();
    var target = e.target;

    $.ajax(target.action, {
      method: 'DELETE',
      data: $(this).serialize()
    })
    .done(function(data) {
      console.log(target)
      $(target).parent().remove();
    })
    .fail(function() {
      alert('failed to delete comment');
    });
  });
});
