json.events do
  json.array! @events.each do |key, value|
    json.date key.strftime("%A")
    json.events value.group_by_hour { |u| u.start_datetime } do |key, value|
      json.time key.strftime("%l:%M %p")
      json.events value do |item|
        json.id item.id
        json.name item.event_name
        json.description item.external_desc
        json.location item.location
        json.hosts item.host
        json.start_time item.start_datetime.strftime("%l:%M %p")
        json.end_time item.end_datetime.strftime("%l:%M %p")
        json.age_rating item.age_rating
        json.day item.start_datetime.strftime("%A")
        json.full_start item.start_datetime
        json.full_end item.end_datetime
      end
    end
  end
end
json.updated DateTime.now.strftime("%Y-%m-%d")