$(document).on('turbolinks:load', function() {

  function createHTML(stack,check,Count) {
    if( check ){
      let stackTweet = `・${stack.task} ${stack.count}${stack.unit}<br>`
      return stackTweet;
    } else { 
      let stackTweet = `・${stack.task} ${Count}${stack.unit}<br>`
      return stackTweet;
    }
  }

  $('.count-form').each(function(){
    $(this).on("submit", function(e) {
      e.preventDefault(); 
      let index = $(this).children('.stack-index').text()
      let inputCount = $(`#today-stack-field-${index}`).val();
      let sumCheck = $(`#sum-check-${index}`).prop('checked')
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
        let stackTweet = createHTML(data,sumCheck,inputCount); 
        $(".tweet-sample").append(stackTweet); 
        $(`#stack-count-${index}`).html(data.count + data.unit)
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
      return false;
    });
  });
});
