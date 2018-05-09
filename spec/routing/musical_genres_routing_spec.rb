require "rails_helper"

RSpec.describe MusicalGenresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/musical_genres").to route_to("musical_genres#index")
    end


    it "routes to #show" do
      expect(:get => "/musical_genres/1").to route_to("musical_genres#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/musical_genres").to route_to("musical_genres#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/musical_genres/1").to route_to("musical_genres#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/musical_genres/1").to route_to("musical_genres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/musical_genres/1").to route_to("musical_genres#destroy", :id => "1")
    end

  end
end
