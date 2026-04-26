nomes = ["ana", "bob", "carlos", "bia", "alexandre"]

# 1a) retorne só os nomes com menos de 4 letras

nome_curtos = nomes.select { |x| x.length < 4  }
print nome_curtos # com o puts não mostra o array

# 1b) retorne todos os nomes em maiúsculo
maiusculos = nomes.map { |nome| nome.upcase }
print maiusculos
