# 💎 Ruby — Desafio Consolidador
> Tópicos: Classes, Modules, Iterators, Hashes, Exception Handling  
> Contexto: Sistema de Biblioteca  
> Tempo estimado: 2h a 3h

---

## 📖 Referência rápida

```ruby
# Module
module MeuModule
  def meu_metodo
    puts "#{@variavel}"  # acessa variáveis da classe
  end
end

# Classe
class MinhaClasse
  include MeuModule
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end

  def ativo?    # ? retorna true/false
    true
  end

  def ativar!   # ! modifica o objeto
    @ativo = true
  end
end

# Iterators com array de objetos
objetos.each    { |o| puts o.nome }
objetos.select  { |o| o.ativo? }
objetos.map     { |o| o.nome }
objetos.any?    { |o| o.nome == "Ruby" }
objetos.find    { |o| o.ano < 2000 }

# Hash
hash = { chave: "valor" }
hash[:chave]         # acessando
hash[:nova] = "x"    # adicionando
hash.keys            # todas as chaves
hash.values          # todos os valores

# Exception Handling
begin
  raise "erro!"
rescue => e
  puts e.message
ensure
  puts "sempre roda"
end
```

---

## 🏛️ Contexto — Sistema de Biblioteca

Você vai construir um sistema de biblioteca do zero — parte por parte. Cada parte usa o que você aprendeu e prepara para a próxima.

---

## Parte 1 — Module

Crie um module chamado `Descricao` com um método `resumo` que imprime:

```
"#{@titulo} por #{@autor}"
```

```ruby
# seu código aqui


```

**Resultado esperado:**
```
Dom Casmurro por Machado de Assis
```

---

## Parte 2 — Classe

Crie uma classe `Livro` com:

- `@titulo`, `@autor`, `@ano`, `@disponivel`
- `include` do module `Descricao`
- `attr_reader` para todos os atributos
- Método `disponivel?` → retorna `true` ou `false`
- Método `emprestar!` → muda `@disponivel` para `false`
- Método `devolver!` → muda `@disponivel` para `true`

```ruby
# seu código aqui


```

**Resultado esperado:**
```ruby
livro = Livro.new("Dom Casmurro", "Machado de Assis", 1899, true)
livro.resumo        # => "Dom Casmurro por Machado de Assis"
livro.disponivel?   # => true
livro.emprestar!
livro.disponivel?   # => false
```

<details>
<summary>💡 Dica (só se travar)</summary>

- O `initialize` recebe 4 argumentos: `titulo, autor, ano, disponivel`
- O `disponivel?` só precisa retornar `@disponivel`
- O `emprestar!` só precisa fazer `@disponivel = false`

</details>

---

## Parte 3 — Montando o acervo

Crie um array com pelo menos 5 livros. Deixe 2 indisponíveis chamando `.emprestar!`

```ruby
# seu código aqui


```

<details>
<summary>💡 Dica (só se travar)</summary>

```ruby
acervo = [
  Livro.new("titulo", "autor", ano, true),
  # ...
]

acervo[0].emprestar!  # deixando indisponível
```

</details>

---

## Parte 4 — Iterators

Com o array de livros, resolva cada item:

```ruby
# 4a) imprima o resumo de todos os livros
# dica: each + resumo


# 4b) retorne só os livros disponíveis
# dica: select + disponivel?


# 4c) retorne só os títulos de todos os livros
# dica: map


# 4d) existe algum livro do autor "Machado de Assis"?
# dica: any?


# 4e) qual o livro mais antigo?
# dica: find o menor @ano

```

**Resultado esperado:**
```
--- Todos os livros ---
Dom Casmurro por Machado de Assis
...

--- Disponíveis ---
Dom Casmurro
...

--- Títulos ---
["Dom Casmurro", ...]

--- Tem Machado de Assis? ---
true

--- Livro mais antigo ---
Dom Casmurro por Machado de Assis
```

<details>
<summary>💡 Dica para o 4e (só se travar)</summary>

Para encontrar o mais antigo, você pode ordenar por ano e pegar o primeiro:

```ruby
acervo.min_by { |l| l.ano }
```

</details>

---

## Parte 5 — Hash

```ruby
# 5a) Monte um hash chamado catalogo onde:
# - chave: título do livro (string)
# - valor: hash com autor e ano
#
# exemplo esperado:
# {
#   "Dom Casmurro" => { autor: "Machado de Assis", ano: 1899 },
#   ...
# }
#
# dica: comece com catalogo = {} e use each para preencher


# 5b) imprima só os títulos do catálogo
# dica: catalogo.keys


# 5c) busque o livro "Dom Casmurro" e imprima autor e ano
# dica: catalogo["Dom Casmurro"]

```

<details>
<summary>💡 Dica para o 5a (só se travar)</summary>

```ruby
catalogo = {}

acervo.each do |livro|
  catalogo[livro.titulo] = { autor: livro.autor, ano: livro.ano }
end
```

</details>

---

## Parte 6 — Exception Handling

Crie um método `buscar_livro(catalogo, titulo)` que:

- Se encontrar → imprime `"titulo — autor (ano)"`
- Se não encontrar → lança erro com `raise` e trata com `rescue`

```ruby
# seu código aqui


# teste com:
buscar_livro(catalogo, "Dom Casmurro")
buscar_livro(catalogo, "Livro Inexistente")
```

**Resultado esperado:**
```
Dom Casmurro — Machado de Assis (1899)
Livro não encontrado no catálogo!
```

<details>
<summary>💡 Dica (só se travar)</summary>

```ruby
def buscar_livro(catalogo, titulo)
  begin
    raise "não encontrado" unless catalogo[titulo]
    # imprime o livro aqui
  rescue => e
    puts "Livro não encontrado no catálogo!"
  end
end
```

</details>

---

## ✅ Como usar este arquivo

1. Crie um arquivo `biblioteca.rb` no seu editor
2. Resolva uma parte por vez — não pule etapas!
3. Rode com `ruby biblioteca.rb` após cada parte
4. Use `p` para inspecionar resultados durante o desenvolvimento
5. Mande as respostas pro Ruben revisar! 😄

---

## 📝 Checklist

- [ ] Parte 1 — Module `Descricao`
- [ ] Parte 2 — Classe `Livro`
- [ ] Parte 3 — Array com 5 livros
- [ ] Parte 4a — `each` + `resumo`
- [ ] Parte 4b — `select` disponíveis
- [ ] Parte 4c — `map` títulos
- [ ] Parte 4d — `any?` autor
- [ ] Parte 4e — livro mais antigo
- [ ] Parte 5a — montar `catalogo`
- [ ] Parte 5b — `keys` do catálogo
- [ ] Parte 5c — busca por título
- [ ] Parte 6 — `buscar_livro` com exception handling

---

*Trilha Ruby → Rails | Desafio Consolidador* 💎