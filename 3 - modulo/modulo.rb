module Autenticavel
  def autenticar
    puts "#{@nome} autenticado!"  # interpolação direto aqui!
  end
end

module Relatorio
  def gerar_relatorio
    puts "#{@nome} gerou um relatorio"  # interpolação direto aqui!
  end
end

class Cliente
  include Autenticavel

  def initialize(nome)
    @nome = nome
  end
end

class Admin
  include Autenticavel
  include Relatorio

  def initialize(nome)
    @nome = nome
  end
end

cliente = Cliente.new("Ana")
cliente.autenticar
# => "Ana autenticado!"

admin = Admin.new("Bob")
admin.autenticar
admin.gerar_relatorio
# => "Bob autenticado!"