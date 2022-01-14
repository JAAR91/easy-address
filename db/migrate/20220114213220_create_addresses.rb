class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :calle
      t.integer :ext_number
      t.integer :int_number
      t.integer :postal_code
      t.string :colonia
      t.string :municipio
      t.string :estado
      t.string :pais
      t.integer :user_id

      t.timestamps
    end
  end
end
