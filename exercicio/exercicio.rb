module Descricao
  def resumo
    puts "#{@titulo} por #{@autor}"
  end
end

class Livro
  include Descricao

  attr_reader :titulo, :autor, :ano, :disponivel

  def initialize(titulo, autor, ano, disponivel)
    @titulo = titulo
    @autor = autor
    @ano = ano
    @disponivel = disponivel
  end

  def disponivel?
    @disponivel
  end

  def emprestar!
    @disponivel = false
  end

  def devolver!
    @disponivel = true
  end
end

acervo = [
  Livro.new("Dom Casmurro", "Machado de Assis", 1899, true),
  Livro.new("Memórias Póstumas de Brás Cubas", "Machado de Assis", 1881, true),
  Livro.new("O Alquimista", "Paulo Coelho", 1988, true),
  Livro.new("Capitães da Areia", "Jorge Amado", 1937, true),
  Livro.new("A Hora da Estrela", "Clarice Lispector", 1977, true)
]

acervo[2].emprestar!
acervo[4].emprestar!

puts "--- Todos os livros ---"
acervo.each { |livro| livro.resumo }

puts
puts "--- Disponíveis ---"
disponiveis = acervo.select { |livro| livro.disponivel? }
disponiveis.each { |livro| puts livro.titulo }

puts
puts "--- Títulos ---"
titulos = acervo.map { |livro| livro.titulo }
p titulos

puts
puts "--- Tem Machado de Assis? ---"
tem_machado = acervo.any? { |livro| livro.autor == "Machado de Assis" }
puts tem_machado

puts
puts "--- Livro mais antigo ---"
mais_antigo = acervo.min_by { |livro| livro.ano }
mais_antigo.resumo

catalogo = {}
acervo.each do |livro|
  catalogo[livro.titulo] = { autor: livro.autor, ano: livro.ano }
end

puts
puts "--- Títulos do catálogo ---"
p catalogo.keys

puts
puts "--- Buscar 'Dom Casmurro' no catálogo ---"
dom = catalogo["Dom Casmurro"]
puts "#{dom[:autor]} (#{dom[:ano]})"

def buscar_livro(catalogo, titulo)
  begin
    raise "não encontrado" unless catalogo[titulo]
    info = catalogo[titulo]
    puts "#{titulo} — #{info[:autor]} (#{info[:ano]})"
  rescue => _e
    puts "Livro não encontrado no catálogo!"
  end
end

puts
buscar_livro(catalogo, "Dom Casmurro")
buscar_livro(catalogo, "Livro Inexistente")
