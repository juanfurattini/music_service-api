class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.attachment :art
      t.references :musical_genre, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
