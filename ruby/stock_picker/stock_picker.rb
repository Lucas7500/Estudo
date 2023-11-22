def stock_picker(array)
  buy_price = 0
  sell_price = 0
  best_profit = 0

  array.each_with_index do |buy, idx|
    for sell in array.slice((idx + 1)...array.length)
      next unless sell - buy > best_profit

      best_profit = sell - buy
      sell_price = sell
      buy_price = buy
    end
  end

  [array.index(buy_price), array.index(sell_price)]
end

puts stock_picker([17, 3, 6, 8, 4, 8, 6, 10, 1])
