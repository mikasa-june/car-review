$(function(){
  function buildHTML(comment){
    var html =
      `<div class="comment__list--box">
        <div class="user-name">
          <a href="/users/${comment.user_id}">${comment.user_name}</a>                                    
        </div>
        <div class="date">
          ${comment.created_at}
        </div>
      </div>
      <div class="comment__list--bottom">
        <div class="comment">
          ${comment.text}
        </div>
        <div class="delete__btn">
        </div>
        <div class="fav">
        </div>
      </div>`
    return html;
  };
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment__list').prepend(html);
      $('.textbox').val('');
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  });
});