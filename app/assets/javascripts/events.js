$(function() {
  function addEvent(event) {
    let html = `
      <a class="event_link" href="/events/${event.id}"><div class="event_card">
        <div class="event_card__upper">
            <div class="event_image">
              <img class="event_image__content" src=${event.image.url}>
            </div>
          </div>
          <div class="event_card__lower">
            <div class="event_name">
              ${event.name}
            </div>
            <div class="event_date">
              日にち：
              ${event.date}
            </div>
            <div class="event_time">
              時間　：
              ${event.open_time.substr(11, 5)}
              〜
              ${event.end_time.substr(11, 5)}
            </div>
            <div class="event_place">
              場所　：
              ${event.place}
            </div>
          </div>
        </div>
      </a>
    `;
    $("#event_search_result").append(html);
  }

  function addNoEvent() {
    let html = `
      <div class="no_event">
        <i class="fas fa-exclamation-triangle">
          イベントが見つかりません
        </i>
      </div>
    `
    $("#event_search_result").append(html);
  }

  $("#event_seach_field").on("keyup", function() {
    let input = $("#event_seach_field").val();
    $.ajax({
      type: "GET",
      url: "/events",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(events) {
      $("#event_search_result").empty();
      console.log(events)
      if (events.length !== 0) {
        $("#event_index").empty();
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