class CreateMusicalGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :musical_genres do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
