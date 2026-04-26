puts "Bem vindo ao adivinhe um numero"

# print não quebra linha; puts quebra.
print "Qual seu nome? "

# gets lê uma linha do teclado (inclui "\n" no final).
# chomp remove essa quebra de linha.
input = gets&.chomp
puts "Bem vindo #{input}!"

numero_randomico = rand(100) # 0..99
tentativas = 10

acertou = false

# until: repete ENQUANTO a condição for falsa
until tentativas == 0 || acertou == true
  print("Digite um numero (0..99): ")
  numero_digitado = gets.to_i # to_i vira 0 se a entrada não for número

  if numero_digitado == numero_randomico
    puts("VOCE ACERTOU")
    acertou = true
  elsif numero_digitado < numero_randomico
    puts("Tente novamente o numero que você digitou é menor!")
    tentativas -= 1
    puts("tentativas restantes #{tentativas}")
  elsif numero_digitado > numero_randomico
    puts("Tente novamente o numero que você digitou é maior!")
    tentativas -= 1
    puts("tentativas restantes #{tentativas}")
  end
end

puts("Fim de jogo! O numero era #{numero_randomico}.") if acertou == false

