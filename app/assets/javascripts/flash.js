$(document).ready(function() {
  //queue()で処理を溜めてdequeue()で実行。3秒経ったらfadeOut()
 $(".notification").fadeIn().queue(function() {
     setTimeout(function(){$(".notification").dequeue();
     }, 1000);
 });
 $(".notification").fadeOut();
});
