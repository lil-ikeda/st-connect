$(function(){
  $('.js_modal_open').on('click',function(){
      $('.event_post').fadeOut(200);
      $('.js_modal').fadeIn();
  });
  $('.js_modal_close').on('click',function(){
      $('.js_modal').fadeOut();
      $('.event_post').fadeIn();
      return false;
  });
});