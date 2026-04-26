# 💎 Ruby — Fundamentos para o Rails

> Anotações de estudo baseadas no livro **Head First Ruby** (O'Reilly)  
> Foco: conceitos essenciais antes de entrar no Rails

---

## 📌 Variáveis — Escopos

```ruby
nome      # variável local — morre ao fim do método
@nome     # instance variable — pertence ao objeto
@@nome    # class variable — compartilhada entre todos os objetos da classe
```

**Exemplo prático:**
```ruby
class Animal
  def initialize(nome)
    @nome = nome  # cada objeto guarda o seu próprio @nome
  end
end

rex  = Animal.new("Rex")
bolt = Animal.new("Bolt")
# rex e bolt têm @nome independentes!
```

---

## 📌 attr_reader, attr_writer, attr_accessor

Em vez de escrever getters e setters manualmente, Ruby oferece atalhos:

```ruby
class Produto
  attr_reader   :nome    # cria apenas getter (só leitura)
  attr_writer   :preco   # cria apenas setter (só escrita)
  attr_accessor :ativo   # cria getter + setter (leitura e escrita)

  def initialize(nome, preco)
    @nome  = nome
    @preco = preco
    @ativo = true
  end

  def to_s
    "Produto: #{@nome} - R$ #{@preco}"
  end
end

p = Produto.new("Café", 29.90)
puts p.nome      # getter — funciona!
p.preco = 34.90  # setter — funciona!
puts p           # chama to_s automaticamente
```

> 💡 **Dica Rails:** `attr_accessor` é muito usado para atributos temporários que
> **não precisam ser salvos no banco de dados** (ex: senha temporária, token de sessão).

---

## 📌 Herança

O operador `<` indica herança em Ruby:

```ruby
class Animal
  def respirar
    puts "Respirando..."
  end
end

class Cachorro < Animal  # Cachorro herda de Animal
  def latir
    puts "Au au!"
  end
end

rex = Cachorro.new
rex.respirar  # herdado de Animal
rex.latir     # próprio de Cachorro
```

**No Rails, a cadeia de herança é:**
```ruby
User < ApplicationRecord < ActiveRecord::Base
#      ^^^^^^^^^^^^^^^^^
#      essa classe conecta seu objeto ao banco de dados
```

---

## 📌 to_s — Representação em texto

Quando você usa `puts` com um objeto, Ruby chama `.to_s` automaticamente:

```ruby
class Animal
  def initialize(nome)
    @nome = nome
  end

  def to_s
    "Eu sou #{@nome}"  # interpolação de string com #{}
  end
end

cachorro = Animal.new("Rex")
puts cachorro  # imprime: Eu sou Rex
```

---

## 📌 Blocks

Um **block** é um trecho de código que você passa para um método executar.  
É a mesma ideia de passar uma função como argumento em outras linguagens.

```ruby
# Sintaxe com do...end — mais comum para múltiplas linhas
[1, 2, 3].each do |numero|
  puts numero * 2
end

# Sintaxe com {} — mais comum para uma linha só
[1, 2, 3].each { |numero| puts numero * 2 }

# Ambas produzem: 2, 4, 6
```

**Como ler:** *"Para cada número do array, faça isso com ele."*

> 💡 O nome entre `| |` é você quem escolhe — mas use sempre o mesmo nome dentro do block!

---

## 📌 Métodos úteis com Blocks

### each — iterar sobre uma coleção

```ruby
nomes = ["Ana", "Bob", "Carlos"]

nomes.each do |nome|
  puts nome
end
```

### select — filtrar elementos

```ruby
precos = [30, 75, 20, 90, 45, 60]

# retorna apenas os preços acima de 50
caros = precos.select { |preco| preco > 50 }
# => [75, 90, 60]
```

### map — transformar elementos

```ruby
precos = [30, 75, 20]

# aplica 10% de desconto em todos
com_desconto = precos.map { |preco| preco * 0.9 }
# => [27.0, 67.5, 18.0]
```

---

## 📌 Blocks no Rails na prática

```ruby
# iterar sobre todos os usuários do banco
User.all.each do |user|
  puts user.nome
end

# filtrar usuários ativos
ativos = User.all.select { |user| user.ativo? }

# buscar o primeiro admin
admin = User.all.find { |user| user.admin? }
```

---

## 📌 Symbols

Symbols aparecem muito em Ruby — especialmente com `attr_reader/writer/accessor`:

```ruby
attr_reader :nome      # :nome é um symbol
attr_accessor :preco   # :preco é um symbol
```

Um symbol é como uma string, mas **imutável e mais eficiente em memória**.  
Sempre começa com `:`.

---

## 🗂️ Resumo rápido

| Conceito | O que faz |
|---|---|
| `@variavel` | Instance variable — pertence ao objeto |
| `attr_reader` | Cria getter automático |
| `attr_writer` | Cria setter automático |
| `attr_accessor` | Cria getter + setter |
| `<` | Herança entre classes |
| `to_s` | Define como o objeto vira texto |
| `do...end` / `{}` | Sintaxes para blocks |
| `each` | Itera sobre coleção |
| `select` | Filtra elementos |
| `map` | Transforma elementos |
| `:symbol` | Identificador imutável |

---

## 🧭 Índice do seu repositório (onde está cada exemplo)

- **Hello World**: `hello_world/program.rb`
- **Básico**
  - **Exercícios**: `1 - basico/0 - exercicios/classe_cachorro.rb`
  - **Conceitos**
    - `1 - basico/1 - conceitos/variaveis.rb`
    - `1 - basico/1 - conceitos/tipo_primitivos.rb`
    - `1 - basico/1 - conceitos/operadores.rb`
    - `1 - basico/1 - conceitos/entrada_de_dados.rb`
  - **Classes e métodos**
    - `1 - basico/2 - classes e metodos/definindo_classes.rb`
    - `1 - basico/2 - classes e metodos/definindo_metodos.rb`
- **Blocks**: `2 - blocks/blocks.rb`
- **Bundler/Gems**: `1 - basico/instalar_gems.md`

---
