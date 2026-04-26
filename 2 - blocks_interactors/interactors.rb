array = [10, 20, 30, 40, 50]

array.each    { |n| puts n }          # itera — não retorna nada útil
array.map     { |n| n * 2 }           # transforma => [20, 40, 60, 80, 100]
array.select  { |n| n > 25 }          # filtra    => [30, 40, 50]
array.find    { |n| n > 25 }          # primeiro  => 30
array.any?    { |n| n > 45 }          # pergunta  => true
array.all?    { |n| n > 5  }          # pergunta  => true
array.reduce(0) { |acc, n| acc + n }  # acumula   => 150