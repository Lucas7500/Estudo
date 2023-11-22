def substring(string, dict)
  substrings = {}
  str_array = string.split(' ')

  dict.each do |word|
    # substrings[word] = 0
    str_array.each do |str|
      # substrings[word] += 1 if str.downcase.include?(word)
      if str.include?(word)
        substrings.include?(word) ? substrings[word] += 1 : substrings[word] = 1
      end
    end
  end

  # substrings.map {|key, value| substrings.delete(key) if value == 0}

  substrings
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts substring("Howdy partner, sit down! How's it going?", dictionary)
