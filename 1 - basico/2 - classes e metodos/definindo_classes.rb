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

# attr_reader — pode LER nome_attr (getter)
puts nova_pessoa.nome_attr        # => "Eduardo"

# attr_writer — pode ESCREVER idade_attr (setter), mas não pode ler.
nova_pessoa.idade_attr = 22       # funciona normalmente (setter)

puts nova_pessoa.cidade_attr      # => "São Paulo"
nova_pessoa.cidade_attr = "Campinas"
puts nova_pessoa.cidade_attr      # => "Campinas"


# ❌ CASOS QUE GERAM ERRO (exemplos protegidos para o arquivo continuar rodando)
# A ideia aqui é você VER a mensagem de erro e entender o motivo.

begin
  nova_pessoa.nome_attr = "Carlos" # attr_reader: não cria setter
rescue NoMethodError => e
  puts "Erro esperado (attr_reader não tem setter): #{e.message}"
end

begin
  puts nova_pessoa.idade_attr # attr_writer: não cria getter
rescue NoMethodError => e
  puts "Erro esperado (attr_writer não tem getter): #{e.message}"
end
