$(function(){
  function buildHTML(comment){
    // コメントがある場合のみコメントを追加
    if (comment.text && comment.email == "guest@example.com") {
      var html = `<div class="comment_form__content">
                    <div class="comment_left">
                      <a class="comment_links" href="/users/${comment.user_id}">
                        <img src="/assets/user_test_login-3415ac9caf57877a44a7b2dced4bcc8e8dfd96c7fbfdc3647e8c2cff8f9ab214.jpg" class="comment_form__content--img">
                      </a>
                    </div>
                    <div class="comment_right">
                      <strong>
                        <a class="comment_form__content--name" href="/users/${comment.user_id}">${comment.user_name}</a>
                      </strong>
                      <p class="comment_form__content--text">
                        ${comment.text}
                      </p>
                    </div>
                    <div class="comment_delete">
                      <div class="comment_time">
                        今
                      </div>
                      <a class="comment_delete__link" rel="nofollow" data-method="delete" href="/events/${comment.event_id}/comments/${comment.id}">削除</a>
                    </div>
                  </div>`
      return html;
    } else if (comment.text) {
      var html = `<div class="comment_form__content">
                    <div class="comment_left">
                      <a class="comment_links" href="/users/${comment.user_id}">
                        <img src=${comment.user_image} class="comment_form__content--img">
                      </a>
                    </div>
                    <div class="comment_right">
                      <strong>
                        <a class="comment_form__content--name" href="/users/${comment.user_id}">${comment.user_name}</a>
                      </strong>
                      <p class="comment_form__content--text">
                        ${comment.text}
                      </p>
                    </div>
                    <div class="comment_delete">
                      <div class="comment_time">
                        今
                      </div>
                      <a class="comment_delete__link" rel="nofollow" data-method="delete" href="/events/${comment.event_id}/comments/${comment.id}">削除</a>
                    </div>
                  </div>`
      return html;
    }
  }

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
      $('.comments').prepend(html);
      $('.textbox').val('');
      $('.comment_form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})