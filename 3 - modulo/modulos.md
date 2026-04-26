# 💎 Ruby — Modules e Mixins

> Tópico: como reutilizar comportamentos entre classes sem herança múltipla  
> Pré-requisito: Classes, Herança, Instance Variables

---

## 📌 O problema que Modules resolvem

Em Ruby, uma classe só pode herdar de **uma** classe pai:

```ruby
class Cachorro < Animal   # ✅ funciona
class Cachorro < Animal, Nadador  # ❌ erro! herança múltipla não existe
```

Mas e se `Cachorro` precisar de comportamentos de várias fontes?
A resposta é: **Modules!**

---

## 📌 O que é um Module?

| | Classe | Module |
|---|---|---|
| Cria objetos? | ✅ Sim | ❌ Não |
| Herança? | ✅ Sim | ❌ Não |
| Reutilizável? | ✅ Sim | ✅ Sim |
| Quantos por classe? | só 1 pai | quantos quiser |

> 💡 Regra prática:
> - *"Cachorro **é um** Animal"* → herança
> - *"Cachorro **sabe** nadar"* → module

---

## 📌 Sintaxe básica

```ruby
# definindo um module
module Nadador
  def nadar
    puts "#{self.class} está nadando!"
  end
end

module Voador
  def voar
    puts "#{self.class} está voando!"
  end
end

# plugando em classes com include
class Pato
  include Nadador
  include Voador
end

class Peixe
  include Nadador   # mesmo module, classe diferente
end

pato = Pato.new
pato.nadar   # => "Pato está nadando!"
pato.voar    # => "Pato está voando!"

peixe = Peixe.new
peixe.nadar  # => "Peixe está nadando!"
peixe.voar   # => erro! Peixe não incluiu Voador
```

---

## 📌 Module acessa instance variables da classe

Quando um método do module roda, ele roda no **contexto do objeto** — por isso tem acesso ao `@nome` da classe:

```ruby
module Autenticavel
  def autenticar
    puts "#{@nome} autenticado!"  # @nome vem da classe que incluiu!
  end
end

class User
  include Autenticavel

  def initialize(nome)
    @nome = nome
  end
end

user = User.new("Ana")
user.autenticar
# => "Ana autenticado!"
```

---

## 📌 Exemplo completo — Sistema de usuários

```ruby
# module compartilhado entre Cliente e Admin
module Autenticavel
  def autenticar
    puts "#{@nome} autenticado!"
  end
end

# module exclusivo do Admin
module Relatorio
  def gerar_relatorio
    puts "#{@nome} gerou um relatório"
  end
end

class Cliente
  include Autenticavel          # só autenticação

  def initialize(nome)
    @nome = nome
  end
end

class Admin
  include Autenticavel          # autenticação
  include Relatorio             # + relatórios

  def initialize(nome)
    @nome = nome
  end
end

# testando
cliente = Cliente.new("Ana")
cliente.autenticar
# => "Ana autenticado!"
cliente.gerar_relatorio
# => erro! Cliente não tem esse comportamento

admin = Admin.new("Bob")
admin.autenticar
# => "Bob autenticado!"
admin.gerar_relatorio
# => "Bob gerou um relatório"
```

---

## 📌 No Rails — Concerns

O Rails usa modules o tempo todo através de **Concerns**:

```ruby
# app/models/concerns/autenticavel.rb
module Autenticavel
  extend ActiveSupport::Concern  # module turbinado do Rails

  def autenticar
    # lógica de autenticação
  end
end

# app/models/user.rb
class User < ApplicationRecord
  include Autenticavel
end

# app/models/admin.rb
class Admin < ApplicationRecord
  include Autenticavel
end
```

> 💡 A base que você aprendeu aqui é exatamente como o Rails organiza comportamentos compartilhados entre models!

---

## 🗂️ Resumo rápido

```ruby
module MeuModule       # define o module
  def meu_metodo       # métodos que serão compartilhados
    # acessa @variaveis da classe que incluiu
  end
end

class MinhaClasse
  include MeuModule    # pluga o module na classe
end

objeto = MinhaClasse.new
objeto.meu_metodo      # método do module disponível no objeto
```

---

## ✅ Quando usar cada um

| Situação | Solução |
|---|---|
| `Cachorro` é um tipo de `Animal` | Herança `<` |
| `Cachorro` e `Pato` sabem nadar | Module `include` |
| Comportamento exclusivo de `Admin` | Module só no `Admin` |
| Comportamento compartilhado entre models no Rails | Concern |

---

*Trilha Ruby → Rails \| Tópico 3: Modules e Mixins* 💎