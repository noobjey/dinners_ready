require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET#index" do
    let!(:item1) { Fabricate(:item) }
    let!(:item2) { Fabricate(:item, name: "Hotdog", category_id: 2) }
    let!(:item3) { Fabricate(:item, name: "Potato", category_id: 3) }

    it "exists" do
      expect(true).to be true
    end

    it "gets all the items" do
      get :index, format: :json
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data.count).to eq 3
    end
  end
end
