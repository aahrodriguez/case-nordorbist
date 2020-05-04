json.array! @veiculos do |veiculo|
  json.extract! veiculo, :id, :marca, :veiculo, :descricao, :ano, :vendido, :created_at, :updated_at
end
