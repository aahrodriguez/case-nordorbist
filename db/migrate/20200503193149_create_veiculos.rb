class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :veiculo
      t.integer :ano
      t.text :descricao
      t.boolean :vendido
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
