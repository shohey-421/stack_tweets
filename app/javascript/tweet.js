$(document).on('turbolinks:load', function(){
  $('#tweet-btn').on('click',function(){
    const originalText = $('.tweet-sample').html().trim();
    const tweetText = originalText.replace(/#/g,'%23').replace(/<br>/g,'%0a') + '%0a'
    const site_url = "https://bit.ly/36S5ZRs"
    open( `https://twitter.com/intent/tweet?text=${tweetText}&url=${site_url}`, "_blank") ;
    $('.tweet-sample').text("#今日の積み上げ");
  });
});