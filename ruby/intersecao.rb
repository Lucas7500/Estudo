# Intersecção de dois vetores
# Escreva um programa em C que defina 2 vetores, A e B de 5 elementos inteiros, cujos valores devem
# ser lidos, e atribua ao vetor I a intersecção dos vetores A e B. Deve-se imprimir o conteúdo dos
# vetores A, B e I. Considere que em cada vetor (A e B) poderá haver valores repetidos.
# (Nota: A ∩ B significa tomar todos os elementos que estão contidos em A e também em B.)
# Exemplo: para o vetor A com conteúdo 13 10 11 9 9 e para o vetor B com conteúdo 8 9 10 11 12 11,
# o vetor I receberá o seguinte conteúdo: 10 11 9

A = Array.new(5)
B = Array.new(5)

for i in 0...5
  print "A[#{i}]: "
  A[i] = gets.chomp.to_i
end

puts

for i in 0...5
  print "B[#{i}]: "
  B[i] = gets.chomp.to_i
end

puts

I = (A + B) - (A - B) - (B - A)
I.uniq!

I.each_with_index { |element, idx| puts "I[#{idx}]: #{element}" }
