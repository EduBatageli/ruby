# Variáveis e tipos em Ruby
#
# Ruby é dinamicamente tipado: a variável não "tem tipo fixo";
# quem tem tipo é o OBJETO que ela aponta.

nome = "Eduardo"      # String
idade = 25            # Integer
altura = 1.75         # Float
estudante = true      # TrueClass (boolean)

idade += 1            # incremento
nome += " Batageli".upcase # concatenação + método de String

# Métodos úteis em números
eh_par = idade.even?  # retorna true/false

puts "nome: #{nome} (#{nome.class})"
puts "idade: #{idade} (#{idade.class})"
puts "altura: #{altura} (#{altura.class})"
puts "estudante: #{estudante} (#{estudante.class})"
puts "idade é par? #{eh_par}"