require 'json'

# Sort json string passed as parameter by price and by name if prices are the same.
def sort_by_price_ascending(json_string)
  prods = JSON.parse json_string
  prods.sort_by! { |hsh| [hsh["price"], hsh["name"]] }
  return prods.to_json
end

# Test function with two different json strings
puts sort_by_price_ascending('[{"name":"eggs","price":1.0},{"name":"coffee","price":9.99},{"name":"rice","price":4.04}]')
puts sort_by_price_ascending('[{"name":"bananas","price":2.65},{"name":"pinnaple","price":5.99},{"name":"bananas","price":2.05},{"name":"oranges","price":6.99}]')
