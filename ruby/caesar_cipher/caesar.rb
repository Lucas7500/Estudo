def encrypt(array, alphabet, key)
  for i in 0..(array.length)
    for j in 0...(alphabet.length)
      if array[i] == alphabet[j]
        array[i] = alphabet[(j + key) % 26]
        break
      end
    end
  end
end

def caesar_cipher(string, key)
  uppercase = ('A'..'Z').to_a
  lowercase = ('a'..'z').to_a

  letter_array = string.chars

  encrypt(letter_array, uppercase, key)
  encrypt(letter_array, lowercase, key)

  encrypted_string = letter_array.join('')

  puts encrypted_string
end

caesar_cipher('be sure to drink your Ovaltine', 13)
