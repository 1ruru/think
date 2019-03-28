$(function(){
  function buildHTML(chat){
    var html = `<div class="message message-me">
                  <div class="message__post-info">
                  <p class="message__post-info--post-user">
                  ${chat.user_name}
                  </p>
                  <p class="message__post-info--post-date">
                  ${chat.chat_created}
                  </p>
                  <p class="message__post-message">
                  ${chat.chat}

                  </p>
                  <a rel="nofollow" data-method="patch" href="/groups/${chat.group_id}/chats/${chat.chat_id}"><i class="fa fa-trash"></i>
                  </a></div>
                </div>`
    return html;
  }
  $('.form-body').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.new-message__input-box--text').val('')
      $('.main-body').animate({scrollTop: $('.main-body')[0].scrollHeight}, 1000);
      $('.btn-submit').prop("disabled",false);
    })
    .fail(function(){
      alert('error');
    });
  });
});