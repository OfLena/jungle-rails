# require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature, js: true do
#    # SETUP
#    before :each do
#     @category = Category.create! name: 'Apparel'

#     10.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         image: open_asset('apparel1.jpg'),
#         quantity: 10,
#         price: 64.99
#       )      
#     end
#   end

#   scenario "They click on Product to view product details page" do
#     visit root_path
#     first('.product').click_on 'Details'

#     # commented out b/c it's for debugging only
    

#     expect(page).to have_css '.products-show'
#     save_and_open_screenshot
#   end

# end
