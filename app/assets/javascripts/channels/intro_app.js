$(function(){
  // 「id="jQueryBox"」を非表示
  $(".intro1").css("display", "none");
  $(".intro2").css("display", "none");
  $(".intro3").css("display", "none");


  $(".click1").click(function(){
      $(".intro1").slideDown(1000);
  });
  $(".click2").click(function(){
    $(".intro2").slideDown(1000);
  });
  $(".click3").click(function(){
    $(".intro3").slideDown(1000);
  });

});