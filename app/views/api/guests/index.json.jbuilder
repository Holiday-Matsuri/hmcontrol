json.guests do
    json.array! @guests do |key, value|
      if key == 'DJ'
        json.type key
      else
        json.type key.titleize
      end
      json.guests value.sort do |item|
        json.id item.id
        json.name item.guest_name
        json.description item.guest_description
        json.slug item.slug
      end
    end
  end