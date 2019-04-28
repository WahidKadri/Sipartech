class CreateCommunes < ActiveRecord::Migration[5.2]
  def change
    create_table :communes do |t|
      t.string :postal_code
      t.string :commune_name
      t.float :altitude_moyenne
      t.float :superficie
      t.float :population

      t.timestamps
    end
  end
end
