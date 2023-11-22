# class CaesarCipher
#     def translate(message, shift, result = '')
#       message.each_char do |char|
#         base = char.ord < 91 ? 65 : 97
#         # Modifies Lowercase & Uppercase
#         if char.ord.between?(65, 90) || char.ord.between?(97, 122)
#           rotation = (((char.ord - base) + shift) % 26) + base
#           result += rotation.chr
#         # Keeps spaces & punctuation
#         else
#           result += char
#         end
#       end
#       result
#     end
#   end

def caesar_cipher(message, shift)
  result = ''
  message.each_char do |char|
    base = char.ord < 91 ? 65 : 97

    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      encrypted_char = (((char.ord - base) + shift) % 26) + base
      result += encrypted_char.chr
    else
      result += char
    end
  end
  result
end

puts caesar_cipher('What a string!', 5)
