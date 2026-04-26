# Tipos comuns em Ruby
#
# Observação: Ruby não tem "tipos primitivos" como algumas linguagens.
# Quase tudo é objeto (até números e boolean).

puts "Eduardo"                # String
puts "Batageli"               # String
puts 42                       # Integer
puts 3.14                     # Float
puts true                     # TrueClass (boolean)
puts [1, 2, 3].inspect        # Array (inspect mostra o conteúdo)
puts({ name: "Eduardo", age: 25 }.inspect) # Hash (o “dicionário” do Ruby)

# Dica: .class te ajuda a confirmar o tipo do objeto
puts "== classes =="
puts "texto".class
puts 42.class
puts 3.14.class
puts true.class
puts [1, 2, 3].class
puts({ a: 1 }.class)
