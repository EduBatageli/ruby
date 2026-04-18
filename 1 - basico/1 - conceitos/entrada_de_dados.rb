puts "Bem vindo ao adivinhe um numero"
print "Qual seu nome? " # nao tem qubra de linha
input = gets.chomp #chomp tira a quebra de linha padrão do final
puts "Bem vindo #{input}!"

numero_randomico = rand(100)
tentativas = 10

acertou = false

until tentativas == 0 || acertou == true
  print("Digite um numero: ")
  numero_digitado = gets.to_i

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

