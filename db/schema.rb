# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_07_204614) do

  create_table "albums", force: :cascade do |t|
    t.string "name", null: false
    t.string "art_file_name"
    t.string "art_content_type"
    t.integer "art_file_size"
    t.datetime "art_updated_at"
    t.integer "musical_genre_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["musical_genre_id"], name: "index_albums_on_musical_genre_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "bio"
    t.integer "musical_genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musical_genre_id"], name: "index_artists_on_musical_genre_id"
  end

  create_table "musical_genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "duration"
    t.string "source"
    t.integer "musical_genre_id"
    t.integer "album_id"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["musical_genre_id"], name: "index_songs_on_musical_genre_id"
  end

end
