# 💎 Ruby — Desafios: Iterators com Blocks

> Tópico: `each`, `map`, `select`, `find`, `any?`, `all?`, `reduce`  
> Nível: Iniciante → Intermediário  
> Tempo estimado: 1h30 a 2h

---

## 📖 Referência rápida antes de começar

```ruby
array = [10, 20, 30, 40, 50]

array.each    { |n| puts n }            # itera — executa algo para cada elemento
array.map     { |n| n * 2 }            # transforma  => [20, 40, 60, 80, 100]
array.select  { |n| n > 25 }           # filtra       => [30, 40, 50]
array.find    { |n| n > 25 }           # primeiro     => 30
array.any?    { |n| n > 45 }           # pergunta     => true
array.all?    { |n| n > 5  }           # pergunta     => true
array.reduce(0) { |acc, n| acc + n }   # acumula      => 150
```

> 💡 Métodos com `?` sempre retornam `true` ou `false` — convenção Ruby!

---

## 🏋️ Desafio 1 — Aquecimento

```ruby
nomes = ["ana", "bob", "carlos", "bia", "alexandre"]

# 1a) retorne só os nomes com menos de 4 letras
# esperado: ["ana", "bob", "bia"]

# 1b) retorne todos os nomes em maiúsculo
# dica: existe o método .upcase
# esperado: ["ANA", "BOB", "CARLOS", "BIA", "ALEXANDRE"]
```

<details>
<summary>💡 Dica (só se travar)</summary>

- Para contar letras de uma string, use `.length`
- Lembra que `select` filtra e `map` transforma!

</details>

---

## 🛒 Desafio 2 — Loja

```ruby
produtos = [
  { nome: "Café",   preco: 29.90 },
  { nome: "Açúcar", preco: 8.50  },
  { nome: "Leite",  preco: 6.90  },
  { nome: "Pão",    preco: 12.00 }
]

# 2a) retorne só os produtos com preço abaixo de R$15
# esperado: Açúcar, Leite e Pão

# 2b) retorne só os nomes dos produtos (sem os preços)
# esperado: ["Café", "Açúcar", "Leite", "Pão"]

# 2c) calcule o total da compra com reduce
# esperado: 57.3
```

<details>
<summary>💡 Dica (só se travar)</summary>

- Para acessar o preço dentro do hash: `produto[:preco]`
- Para acessar o nome: `produto[:nome]`

</details>

---

## ❓ Desafio 3 — Perguntas

```ruby
idades = [22, 17, 31, 15, 28, 16]

# 3a) tem algum menor de idade? (< 18)
# esperado: true

# 3b) todos são maiores de 14?
# esperado: true

# 3c) qual a primeira idade maior que 25?
# esperado: 31
```

---

## 🏫 Desafio 4 — Classe + Iterator

```ruby
# Crie uma classe Turma com:
# - @alunos como array de nomes
# - método adicionar(nome) que adiciona ao array
# - método aprovados que recebe um array de notas
#   e retorna quantos alunos tiraram >= 6

# Exemplo de uso esperado:
turma = Turma.new
turma.adicionar("Ana")
turma.adicionar("Bob")
turma.adicionar("Carlos")

notas = [8, 4, 7]
puts turma.aprovados(notas)  # => 2
```

<details>
<summary>💡 Dica (só se travar)</summary>

- Inicialize `@alunos` como `[]` no `initialize`
- Use `select` dentro do método `aprovados`
- `.count` pode ser útil no final — ou `.length`

</details>

---

## 🔥 Desafio 5 — Extra (só com `reduce`!)

```ruby
vendas = [150, 80, 200, 50, 300, 120]

# Sem usar .sum, .min ou .max:

# 5a) calcule o total das vendas
# esperado: 900

# 5b) encontre a maior venda
# esperado: 300

# 5c) encontre a menor venda
# esperado: 50
```

<details>
<summary>💡 Dica (só se travar)</summary>

- Para o total: acumule somando
- Para o maior: compare o acumulador com o elemento atual
- Lembra que dentro do reduce você pode usar `if` normalmente!

</details>

---

## ✅ Como usar este arquivo

1. Abra um arquivo `desafios.rb` no seu editor
2. Resolva um desafio por vez
3. Rode com `ruby desafios.rb` no terminal
4. Mande as respostas pro Ruben revisar! 😄

---

## 📝 Espaço para suas respostas

```ruby
# Desafio 1a)


# Desafio 1b)


# Desafio 2a)


# Desafio 2b)


# Desafio 2c)


# Desafio 3a)


# Desafio 3b)


# Desafio 3c)


# Desafio 4)


# Desafio 5a)


# Desafio 5b)


# Desafio 5c)

```

---

*Trilha Ruby → Rails | Tópico 2: Iterators com Blocks* 💎
