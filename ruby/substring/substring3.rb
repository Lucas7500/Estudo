def substrings(string, dictionary)
  string = string.downcase
  string.split(' ').each_with_object(Hash.new(0)) do |word, object|
    dictionary.each { |element| object[element] += 1 if word.include?(element) }
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
