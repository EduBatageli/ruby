# Gems no Ruby — Guia Rápido

## O que são Gems?

Gems são pacotes/bibliotecas do Ruby, equivalente aos pacotes do Node:

| Node | Ruby |
|------|------|
| `package.json` | `Gemfile` |
| `package-lock.json` | `Gemfile.lock` |
| `npm install` | `bundle install` |
| `npx` | `bundle exec` |
| `node_modules/` | `vendor/bundle/` |

---

## Instalando gems apenas no projeto (sem instalar global)

### 1. Inicie o Bundler na raiz do projeto
```bash
bundle init
```
Isso cria o arquivo `Gemfile`.

### 2. Configure o path local
```bash
bundle config set path 'vendor/bundle'
```
Isso faz com que todas as gems sejam instaladas na pasta `vendor/bundle` do projeto.

### 3. Adicione a gem no `Gemfile`
Abra o `Gemfile` e adicione:
```ruby
# frozen_string_literal: true

source "https://rubygems.org"

gem "pry"
```

### 4. Instale
```bash
bundle install
```
A gem será instalada em `vendor/bundle` automaticamente.

### 5. Adicione no `.gitignore`
```
vendor/bundle
.bundle
```

---

## Rodando scripts com as gems do projeto

```bash
bundle exec ruby seu_arquivo.rb
```

---

## Comandos úteis

```bash
# Ver gems instaladas no projeto
bundle show

# Ver onde uma gem específica foi instalada
bundle show nome-da-gem

# Adicionar nova gem (edite o Gemfile e rode)
bundle install

# Ver gems instaladas globalmente
gem list
```

---

## Gems úteis para aprender Ruby

| Gem | Descrição | Equivalente Node |
|-----|-----------|-----------------|
| `pry` | Console interativo para testar código | `node` REPL |
| `sinatra` | Framework web simples | Express |
| `rspec` | Framework de testes | Jest |
| `sequel` | ORM para banco de dados | Prisma |

---

## Exemplo completo de Gemfile

```ruby
# frozen_string_literal: true

source "https://rubygems.org"

gem "pry"
gem "sinatra"
gem "rspec"
```

Depois rode `bundle install` e tudo será instalado em `vendor/bundle`. ✅