class Pessoa
  attr_reader :nome_attr
  attr_writer :idade_attr
  attr_accessor :cidade_attr

  def initialize(nome_params, idade_params, cidade_params)
    @nome_attr = nome_params
    @idade_attr = idade_params
    @cidade_attr = cidade_params
  end
end

# Instância correta
nova_pessoa = Pessoa.new("Eduardo", 21, "São Paulo")

# ✅ CASOS QUE FUNCIONAM

# attr_reader — pode LER nome_attr
puts nova_pessoa.nome_attr        # => "Eduardo"
nova_pessoa.idade_attr = 22       # funciona normalmente

puts nova_pessoa.cidade_attr      # => "São Paulo"
nova_pessoa.cidade_attr = "Campinas"
puts nova_pessoa.cidade_attr      # => "Campinas"


# ❌ CASOS QUE GERAM ERRO

nova_pessoa.nome_attr = "Carlos" # attr_reader
puts nova_pessoa.idade_attr # attr_writer
