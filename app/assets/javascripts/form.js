window.addEventListener("load", function(){
  $(function(){
    $('.icon1').click( function(){
    var target = $(this).data('target');
    $('#' + target ).slideToggle();
    });
    $('.icon2').click( function(){
    var target = $(this).data('target');
    $('#' + target ).slideToggle();
    });
    $('.icon3').click( function(){
    var target = $(this).data('target');
    $('#' + target ).slideToggle();
    });
    $('.icon4').click( function(){
    var target = $(this).data('target');
    $('#' + target ).slideToggle();
    });
  });
});