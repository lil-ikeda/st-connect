$(function() {
  function addEvent(event) {
    let html = `
      <div>
        <p>${event.name}</p>
      </div>
    `;
    $("#event_search_result").append(html);
  }

  function addNoEvent() {
    let html = `
      <div>
        <p>イベントが見つかりません</p>
      </div>
    `
    $("#event_search_result").append(html);
  }

  $("#event_seach_field").on("keyup", function() {
    let input = $("#event_seach_field").val();
    $.ajax({
      type: "GET",
      url: "/events/search",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(events) { // eventsって何？
      $("#event_search_result").empty();
      console.log(events)
      if (events.length !== 0) {
        // $("#event_index").empty(); // 元々のevent一覧を非表示にする
        events.forEach(function(event) {
          addEvent(event);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoEvent();
      }
    })
    .fail(function() {
      alert("通信エラーです。イベントが表示できません");
    });
  });
});