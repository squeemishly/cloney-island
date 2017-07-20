require 'rails_helper'

describe Attraction do
  context "has photo attribute" do
    it "has all the attributes" do
      raw_attraction = {
              "geometry": {
                  "location": {
                      "lat": 48.85837009999999,
                      "lng": 2.2944813
                  }
              },
              "name": "Eiffel Tower",
              "photos": [
                  {
                      "photo_reference":
                      "CmRaAAAAkYtmO5R9m4docIuo-HGALNkkor4tECv68NKqWGJMU7Fbbgahpf6YLZCrmBUexLtLvzW_6IDH5bXboceO9hTIdEW1vH_SB538SHRX_hUF_x8XjWYtFZstD4kuPVzrE0qFEhD0ZslHLhgJcy--UBwst5tEGhTm4TjufhB0gmUNXIJM-rIcrWuxLQ",
                  }
              ],
              "place_id": "ChIJLU7jZClu5kcR4PcOOO6p3I0",
              "vicinity": "Champ de Mars, 5 Avenue Anatole France, Paris"
          }

      attraction = Attraction.new(raw_attraction)

      expect(attraction.name).to eq("Eiffel Tower")
      expect(attraction.vicinity).to eq("Champ de Mars, 5 Avenue Anatole France, Paris")
      expect(attraction.place_id).to eq("ChIJLU7jZClu5kcR4PcOOO6p3I0")
      expect(attraction.photo_url).to eq("https://maps.googleapis.com/maps/api/place/photo?photoreference=CmRaAAAAkYtmO5R9m4docIuo-HGALNkkor4tECv68NKqWGJMU7Fbbgahpf6YLZCrmBUexLtLvzW_6IDH5bXboceO9hTIdEW1vH_SB538SHRX_hUF_x8XjWYtFZstD4kuPVzrE0qFEhD0ZslHLhgJcy--UBwst5tEGhTm4TjufhB0gmUNXIJM-rIcrWuxLQ&sensor=false&maxheight=300&maxwidth=300&key=#{ENV['google_map_api_key']}")
      expect(attraction.lat).to eq(48.85837009999999)
      expect(attraction.lng).to eq(2.2944813)
    end
  end

  context "does not have a photo attribute" do
    it "its a valid attraction" do
      raw_attraction = {
              "geometry": {
                  "location": {
                      "lat": 48.85837009999999,
                      "lng": 2.2944813
                  }
              },
              "name": "Eiffel Tower",
              "place_id": "ChIJLU7jZClu5kcR4PcOOO6p3I0",
              "vicinity": "Champ de Mars, 5 Avenue Anatole France, Paris"
          }

      attraction = Attraction.new(raw_attraction)

      expect(attraction.name).to eq("Eiffel Tower")
      expect(attraction.vicinity).to eq("Champ de Mars, 5 Avenue Anatole France, Paris")
      expect(attraction.place_id).to eq("ChIJLU7jZClu5kcR4PcOOO6p3I0")
      expect(attraction.photo_url).to eq("http://www.slepamapask.eu/img/slepa_mapa.png")
      expect(attraction.lat).to eq(48.85837009999999)
      expect(attraction.lng).to eq(2.2944813)
    end
  end
end
