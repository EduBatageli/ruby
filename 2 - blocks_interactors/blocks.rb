precos = [30, 75, 20, 90, 45, 60]

# Blocks: um trecho de código passado para um método executar.
# Dica de leitura: "para cada preço, faça..."

# each: iterar (normalmente com efeito colateral, ex.: puts)
puts "== each (imprimindo apenas > 50) =="
precos.each do |preco|
  puts preco if preco > 50
end

# select: filtrar (RETORNA um novo array com os elementos que passaram no teste)
caros = precos.select { |preco| preco > 50 }
puts "== select (retorna array) =="
p caros

# map: transformar (RETORNA um novo array com o resultado do bloco)
com_desconto = precos.map { |preco| (preco * 0.9).round(2) }
puts "== map (10% de desconto) =="
p com_desconto
