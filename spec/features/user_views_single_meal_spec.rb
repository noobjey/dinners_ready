require "rails_helper"

RSpec.describe "the item view", type: :feature do
  context "an existing item" do
    it "views a single item" do
      item = Item.create(name: "Hamburger and fries", description: "delicious",
        price: 12, image_url: test_image_url)
      visit items_path

      within(".items-list") do
        within("#item-box") do
          click_link "Hamburger and fries"
        end
      end

      expect(current_path).to eq item_path(item)

      within(".item-show") do
        within(".item-info") do
          expect(page).to have_content "Hamburger and fries"
          expect(page).to have_content "delicious"
          expect(page).to have_content "12"
          expect(page).to have_css("img[src*='#{item.image_url}']")
        end
      end
    end
  end
end