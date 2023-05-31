$(function() {
    $('.card-header').click(function() {
      $(this).parent('.card').siblings().find('.collapse').collapse('hide');
    });
  });