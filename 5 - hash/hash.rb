# ============================================
# 💎 Ruby — Hashes
# ============================================

# Hash é uma estrutura de dados que armazena
# pares de chave => valor — como um dicionário!

# ============================================
# 1. CRIANDO UM HASH
# ============================================

# sintaxe com símbolo (mais comum no Ruby moderno)
produto = {
  nome: "Café",
  preco: 29.90,
  estoque: 10
}

# sintaxe antiga — você pode ver isso em código legado
produto_antigo = {
  :nome => "Café",
  :preco => 29.90
}

# os dois são equivalentes!

# ============================================
# 2. ACESSANDO VALORES
# ============================================

puts produto[:nome]     # => "Café"
puts produto[:preco]    # => 29.90
puts produto[:estoque]  # => 10

# acessando chave que não existe
puts produto[:cor].inspect  # => nil — não quebra!

# ============================================
# 3. ALTERANDO VALORES
# ============================================

produto[:preco] = 34.90       # alterando
produto[:desconto] = 0.10     # adicionando nova chave

puts produto[:preco]    # => 34.90
puts produto[:desconto] # => 0.10

# ============================================
# 4. ARRAY DE HASHES — muito comum no Rails!
# ============================================

produtos = [
  { nome: "Café",   preco: 29.90, estoque: 10 },
  { nome: "Açúcar", preco: 8.50,  estoque: 25 },
  { nome: "Leite",  preco: 6.90,  estoque: 0  },
  { nome: "Pão",    preco: 12.00, estoque: 5  }
]

# ============================================
# 5. ITERANDO COM BLOCKS — aqui tudo se conecta!
# ============================================

# cada — imprimindo todos os produtos
puts "\n--- Todos os produtos ---"
produtos.each do |p|
  puts "#{p[:nome]}: R$ #{p[:preco]}"
end

# select — filtrando produtos com estoque
puts "\n--- Produtos disponíveis ---"
disponiveis = produtos.select { |p| p[:estoque] > 0 }
disponiveis.each { |p| puts p[:nome] }

# map — extraindo só os nomes
puts "\n--- Nomes dos produtos ---"
nomes = produtos.map { |p| p[:nome] }
p nomes
# => ["Café", "Açúcar", "Leite", "Pão"]

# find — primeiro produto barato
puts "\n--- Primeiro produto abaixo de R$10 ---"
barato = produtos.find { |p| p[:preco] < 10 }
puts barato[:nome]
# => "Açúcar"

# reduce — total do estoque
puts "\n--- Total em estoque ---"
total = produtos.reduce(0) { |soma, p| soma + p[:estoque] }
puts "#{total} unidades"
# => 40 unidades

# ============================================
# 6. MÉTODOS ÚTEIS DO HASH
# ============================================

produto = { nome: "Café", preco: 29.90, estoque: 10 }

puts produto.keys    # => [:nome, :preco, :estoque]
puts produto.values  # => ["Café", 29.90, 10]

puts produto.key?(:nome)    # => true  — tem essa chave?
puts produto.key?(:cor)     # => false — não tem!

puts produto.value?(29.90)  # => true  — tem esse valor?

# ============================================
# 7. NO RAILS — como hashes aparecem na prática
# ============================================

# params — dados que vêm do formulário
params = {
  nome: "Ana Silva",
  email: "ana@email.com",
  senha: "123456"
}

puts params[:email]  # => "ana@email.com"

# options — configurações de métodos
# você vai ver muito isso no Rails:
# validates :nome, presence: true, length: { minimum: 3 }
#                  ^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^
#                  hash inline!    hash aninhado!

opcoes = { presence: true, length: { minimum: 3 } }
puts opcoes[:length][:minimum]  # => 3 — hash dentro de hash!