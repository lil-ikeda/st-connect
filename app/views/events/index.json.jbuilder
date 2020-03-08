json.array! @search_events do |event|
  json.id event.id
  json.name event.name
  json.date event.date.strftime("%Y年%m月%d日")
  json.open_time event.open_time
  json.end_time event.end_time
  json.place event.place
  json.image event.image
end
