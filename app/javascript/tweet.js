$(document).on('turbolinks:load', function(){
  $('#tweet-btn').on('click',function(){
    let originalText = $('.tweet-sample').html().trim();
    let tweetText = originalText.replace(/<br>/g,'%0a')
    open( `https://twitter.com/intent/tweet?text=${tweetText}&hashtags=今日の積み上げ,今日の積み上げったー`, "_blank") ;
    $('.tweet-sample').text("");
  });
});