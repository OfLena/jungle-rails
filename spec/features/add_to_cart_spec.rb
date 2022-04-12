require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
     # SETUP
     before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )      
      end
    end
  
    scenario "Cart Starts at 0 and increases by 1 on Click of Add" do
      visit root_path

      expect(find("#navbar")).to have_link("My Cart (0)")

      first('.product').click_on 'Add'
      
      expect(find("#navbar")).to have_link("My Cart (1)")

      save_and_open_screenshot
    end
end
