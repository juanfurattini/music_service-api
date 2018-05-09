require 'rails_helper'

RSpec.describe "MusicalGenres", type: :request do
  describe "GET /musical_genres" do
    it "works! (now write some real specs)" do
      get musical_genres_path
      expect(response).to have_http_status(200)
    end
  end
end
