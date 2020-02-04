$(function(){
  function buildHTML(comment){
    var html =
      `<div class="comment__list--box">
        <div class="user-name">
          <a href="/users/${comment.user_id}">truncate(comment.user.name, length: 20)</a>
        </div>
        <div class="date">
          ${comment.created_at}
        </div>
      <div class="comment__list--bottom">
        <div class="comment">
          ${comment.text}
        </div>
        <div class="delete__btn">
          <a href="#">削除</a>
        </div>
        <div class="fav">
        </div>
      </div>
      `
      return html;
  };


  $('#f').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax ({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      $('.comment__list').append(html);      
      $('#comment_text')[0].reset();
      $('.comment__list').animate({ scrollTop: $('.comment__list')[0].scrollHeight});

    });
  });

});