class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :bio
      t.references :musical_genre, foreign_key: true

      t.timestamps
    end
  end
end
