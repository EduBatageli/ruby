puts "Digite um número para dividir 100:"
input = gets.chomp   # chomp remove o \n do final

begin
  numero = Integer(input)
  puts 100 / numero

rescue ZeroDivisionError
  puts "Não pode dividir por zero!"

rescue ArgumentError
  puts "Número inválido!"

ensure
  puts "Operação finalizada!"  # roda SEMPRE — com ou sem erro
end