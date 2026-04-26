# Métodos em Ruby
#
# Convenção: use snake_case para nomes de métodos.
# Parênteses na chamada são opcionais (ex.: print_sum(1, 2) == print_sum 1, 2).

# Maneira comum de declarar
def print_sum(a, b)
  puts(a + b)
end

# Parâmetros opcionais (valores padrão)
# Se você não passar o argumento, o valor padrão será usado.
def print_sub(a = 1, b = 2)
  puts(a - b)
end

# Retorno:
# Ruby sempre retorna a ÚLTIMA expressão avaliada (o return é opcional).
def soma(a, b)
  a + b
end

# Keyword arguments (muito usados em Ruby/Rails)
def saudacao(nome:, cidade: "São Paulo")
  "Olá, #{nome}! (#{cidade})"
end

puts "== Chamadas =="
print_sum(1, 2)
print_sub
print_sub(10, 3)
puts soma(5, 7)
puts saudacao(nome: "Eduardo")
puts saudacao(nome: "Eduardo", cidade: "Campinas")
