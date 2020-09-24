// jquery書きはじめ
$(function (){
  // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）

  //フォームに入力されている文字数を数える
  //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  var count = $(".js-text1").text().replace(/\n/g, "改行").length;
  //残りの入力できる文字数を計算
  var now_count = 1000 - count;
  //文字数がオーバーしていたら文字色を赤にする
  if (count > 1000) {
    $(".js-text1-count").css("color","red");
  }
  //残りの入力できる文字数を表示
  $(".js-text1-count").text( "残り" + now_count + "文字");

  $(".js-text1").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 1000 - count;

    if (count > 1000) {
      $(".js-text1-count").css("color","red");
    } else {
      $(".js-text1-count").css("color","black");
    }
    $(".js-text1-count").text( "残り" + now_count + "文字");
  });
});



// company#information form 2
$(function (){
  var count = $(".js-text2").text().replace(/\n/g, "改行").length;
  var now_count = 1000 - count;
  if (count > 1000) {
    $(".js-text2-count").css("color","red");
  }
  $(".js-text2-count").text( "残り" + now_count + "文字");
  $(".js-text2").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 1000 - count;
    if (count > 1000) {
      $(".js-text2-count").css("color","red");
    } else {
      $(".js-text2-count").css("color","black");
    }
    $(".js-text2-count").text( "残り" + now_count + "文字");
  });
});


// works#edit form 1
$(function (){
  var count = $(".js-text3").text().replace(/\n/g, "改行").length;
  var now_count = 500 - count;
  if (count > 500) {
    $(".js-text3-count").css("color","red");
  }
  $(".js-text3-count").text( "残り" + now_count + "文字");
  $(".js-text3").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 500 - count;
    if (count > 500) {
      $(".js-text3-count").css("color","red");
    } else {
      $(".js-text3-count").css("color","black");
    }
    $(".js-text3-count").text( "残り" + now_count + "文字");
  });
});


// works#edit form 2
$(function (){
  var count = $(".js-text4").text().replace(/\n/g, "改行").length;
  var now_count = 2000 - count;
  if (count > 2000) {
    $(".js-text4-count").css("color","red");
  }
  $(".js-text4-count").text( "残り" + now_count + "文字");
  $(".js-text4").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 2000 - count;
    if (count > 2000) {
      $(".js-text4-count").css("color","red");
    } else {
      $(".js-text4-count").css("color","black");
    }
    $(".js-text4-count").text( "残り" + now_count + "文字");
  });
});


// works#new form 1
$(function (){
  var count = $(".js-text5").text().replace(/\n/g, "改行").length;
  var now_count = 500 - count;
  if (count > 500) {
    $(".js-text5-count").css("color","red");
  }
  $(".js-text5-count").text( "残り" + now_count + "文字");
  $(".js-text5").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 500 - count;
    if (count > 500) {
      $(".js-text5-count").css("color","red");
    } else {
      $(".js-text5-count").css("color","black");
    }
    $(".js-text5-count").text( "残り" + now_count + "文字");
  });
});


// works#new form 2
$(function (){
  var count = $(".js-text6").text().replace(/\n/g, "改行").length;
  var now_count = 2000 - count;
  if (count > 2000) {
    $(".js-text6-count").css("color","red");
  }
  $(".js-text6-count").text( "残り" + now_count + "文字");
  $(".js-text6").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 2000 - count;
    if (count > 2000) {
      $(".js-text6-count").css("color","red");
    } else {
      $(".js-text6-count").css("color","black");
    }
    $(".js-text6-count").text( "残り" + now_count + "文字");
  });
});


// profile#edit form 1
$(function (){
  var count = $(".js-text7").text().replace(/\n/g, "改行").length;
  var now_count = 250 - count;
  if (count > 250) {
    $(".js-text7-count").css("color","red");
  }
  $(".js-text7-count").text( "残り" + now_count + "文字");
  $(".js-text7").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 250 - count;
    if (count > 250) {
      $(".js-text7-count").css("color","red");
    } else {
      $(".js-text7-count").css("color","black");
    }
    $(".js-text7-count").text( "残り" + now_count + "文字");
  });
});


// profile#edit form 2
$(function (){
  var count = $(".js-text8").text().replace(/\n/g, "改行").length;
  var now_count = 250 - count;
  if (count > 250) {
    $(".js-text8-count").css("color","red");
  }
  $(".js-text8-count").text( "残り" + now_count + "文字");
  $(".js-text8").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 250 - count;
    if (count > 250) {
      $(".js-text8-count").css("color","red");
    } else {
      $(".js-text8-count").css("color","black");
    }
    $(".js-text8-count").text( "残り" + now_count + "文字");
  });
});
