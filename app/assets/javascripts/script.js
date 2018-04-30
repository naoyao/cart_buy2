// ナビゲーションが途中から固定
$(function(){

  var $win = $(window),
      $main = $('.wrapper'),
      $nav = $('.hmainHead'),
      navHeight = $nav.outerHeight(),
      navPos = $nav.offset().top,
      fixedClass = 'is-fixed';
      fixedClass2 = 'is-fixed2';

  // 現在ページのURL取得
  var url = location.href;

  $win.bind("load", function(){
    //現在ページが http://localhost:3000/ の時、position: static;を入れて、position:fiexdを無効にする。
    if (url == "http://localhost:3000/"){
      $nav.addClass(fixedClass2);
    }
  });

  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    if ( value > navPos ) {
      $nav.addClass(fixedClass);
      $main.css('margin-top', navHeight);
    } else {
      $nav.removeClass(fixedClass);
      $main.css('margin-top', '0');
    }
  });
});
// ナビゲーションが途中から固定 @end

// 数字入力ボックスとアップダウンボタン
function spinner(counter,id){
    var step = 1;
    var min = 1;
    var max = 100;

    var kazu = $('#kazu' + id).val();
    console.log(kazu)
    var kazu = parseInt(kazu);
      if (counter == 'up') {
        kazu += step;
      };
      if (counter == 'down') { kazu -= step; };

    if ( kazu < min ) { kazu = min; };
    if ( max < kazu ) { kazu = max; };

    $('#kazu' + id).val(kazu);
}
