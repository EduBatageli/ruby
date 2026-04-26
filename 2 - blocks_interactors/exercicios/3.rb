idades = [22, 17, 31, 15, 28, 16]

# 3a) tem algum menor de idade? (< 18)
menor_que_18 = idades.any? {|i| i < 18}
puts menor_que_18

# 3b) todos são maiores de 14?
all_idades = idades.all? {|i| i > 14}
puts all_idades

# 3c) qual a primeira idade maior que 25?
puts idades.find { |i| i > 25  }