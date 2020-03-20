function MoveCheck() {
  if( confirm("マッチング中のへのフォローを解除すると、チャットメッセージが全て削除されます。本当にフォロー解除しますか？") ) {
      window.location.href = "https://www.nishishi.com/";
  }
  else {
      alert("フォローの解除をやめました。");
  }
}