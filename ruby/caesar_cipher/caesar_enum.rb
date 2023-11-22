def caesar_cipher(message, shift)
  message = message.chars

  message.map! do |char|
    base = char.ord < 91 ? 65 : 97

    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      char = ((((char.ord - base) + shift) % 26) + base).chr
    # char = (((char.ord - base) + shift) % 26) + base
    else
      char
    end
  end
  message = message.join
  # message = message.map! {|char| char.chr}.join
end

puts caesar_cipher('hello, world', 13)
