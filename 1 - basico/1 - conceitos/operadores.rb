# OPERADORES MATEMATICOS

puts 1 + 1
puts 1 - 1
puts 1 * 1
puts 1 / 1
puts 1 % 1
puts 1 ** 1


# OPERADORES DE COMPARACAO

puts 1 == 1
puts 1 != 1
puts 1 > 1
puts 1 < 1
puts 1 >= 1

# OPERADORES LÓGICOS (condição)
# &&  (AND)  -> só é true se ambos forem true
# ||  (OR)   -> true se pelo menos um for true
# !   (NOT)  -> inverte

puts true && true   # AND: só é true se ambos forem true
puts true && false

puts true || false  # OR: é true se pelo menos um for true
puts false || false

puts !true          # NOT: inverte o valor booleano
puts !false

# Pegadinha comum: divisão inteira vs float
puts "== divisão =="
puts 5 / 2    # 2 (Integer / Integer -> Integer)
puts 5.0 / 2  # 2.5 (Float / Integer -> Float)

