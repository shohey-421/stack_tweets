$(document).on('turbolinks:load', function(){
  $('.edit-task-field').each(function(){
    $(this).on('input',function(){
      const editTask = $(this).val()

      if (editTask == ''){
        $('.edit-error-task').fadeIn()
        $('.edit-submit-btn').prop('disabled', true)
      } else {
        ('.edit-error-task').fadeOut()
        $('.edit-submit-btn').prop('disabled', false)
      };
    });
  });

  $('.edit-counter-field').each(function(){
    $(this).on('input',function(){
      const editCount = $(this).val()

      if (editCount == ''){
        $('.edit-error-count').fadeIn()
        $('.edit-submit-btn').prop('disabled', true)
      } else {
        $('.edit-error-count').fadeOut()
        $('.edit-submit-btn').prop('disabled', false)
      };
    });
  });

  $('.edit-unit-field').each(function(){
    $(this).on('input',function(){
      const editUnit = $(this).val()

      if (editUnit == ''){
        $('.edit-error-unit').fadeIn()
        $('.edit-submit-btn').prop('disabled', true)
      } else {
        $('.edit-error-unit').fadeOut()
        $('.edit-submit-btn').prop('disabled', false)
      };
    });
  });
});