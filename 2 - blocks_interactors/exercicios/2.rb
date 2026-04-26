produtos = [
  { nome: "Café",   preco: 29.90 },
  { nome: "Açúcar", preco: 8.50  },
  { nome: "Leite",  preco: 6.90  },
  { nome: "Pão",    preco: 12.00 }
]

# 2a) retorne só os produtos com preço abaixo de R$15

produtos_abaixo_15 = produtos.select { |x| x[:preco] < 15 }.map { |p| p[:nome]  }
print(produtos_abaixo_15)

# 2b) retorne só os nomes dos produtos (sem os preços)

nomes = produtos.map { |p| p[:nome] }
print nomes

# 2c) calcule o total da compra com reduce
produtos.reduce(0) { |acc, p| acc + p[:preco] }
