class Dog
    attr_accessor :nome
    attr_reader :raca

  def initialize(nome, raca)
    @nome = nome
    @raca = raca
  end

  def apresentar
    puts("Meu nome é #{@nome} e sou da raça #{@raca}")
  end

  def latir
    return "Au Au"
  end
end

cachorro1 = Dog.new("Luna", "BC")
cachorro1.apresentar
puts(cachorro1.latir)
