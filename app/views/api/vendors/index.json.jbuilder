json.vendors do 
  json.array! @vendors do |key, value|
    json.title key
    json.data value
  end
end