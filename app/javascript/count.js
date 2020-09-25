$(function() {

  function createHTML(stack,Count) {
    let stackTweet = `${stack.task} ${Count}${stack.unit}<br>`
    return stackTweet;
  }

  $('.count-form').each(function(){
    $(this).on("submit", function(e) {
      e.preventDefault(); 
      let index = $(this).children('.stack-index').text()
      let inputCount = $(`#today-stack-field-${index}`).val(); 
      let url = $(this).attr("action"); 
      $.ajax({
        url: url,  
        type: "PATCH", 
        data: {  
          stack: {count: inputCount}
        },
        dataType: "json"  
      })
      .done(function(data) {
        let stackTweet = createHTML(data,inputCount); 
        $(".tweet-sample").append(stackTweet); 
        $(`#stack-count-${index}`).text(data.count)
        $(`#today-stack-field-${index}`).val("")  
      })
      .fail(function() {
        alert("error!"); 
      })
      .always(function() {
        $(`.submit-btn`).each(function(){
          $(this).removeAttr("disabled"); 
          $(this).removeAttr("data-disable-with"); 
        });
      });
    });
  });
});
