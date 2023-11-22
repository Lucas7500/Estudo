# stock_picker([17,3,6,9,15,8,6,1,10])
# >[1,4]
# gets the greatest difference in array assuming the lowest number has to come first
# returns the index of lowest number, followed by index of highest number

input = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  results = prices.each_with_index.to_a.combination(2).max_by { |buy, sell| sell[0] - buy[0] }.map { |_price, i| i }
end

puts(stock_picker(input))
