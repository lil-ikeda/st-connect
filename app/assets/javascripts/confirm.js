function MoveCheck() {
  if( confirm("マッチング中のへのリクエストを解除すると、チャットメッセージが全て削除されます。本当にリクエスト解除しますか？") ) {
      window.location.href = "https://www.nishishi.com/";
  }
  else {
      alert("リクエストの解除をやめました。");
  }
}