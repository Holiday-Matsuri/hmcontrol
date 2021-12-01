json.artists do 
  json.array! @artists do |key, value|
    json.title key
    json.data value
  end
end