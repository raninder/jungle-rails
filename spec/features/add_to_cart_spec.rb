# require 'rails_helper'

# RSpec.feature "AddToCarts", type: :feature, js: true do
#   # SETUP
#   before :each do
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

#   scenario "cart increases by one when user click the 'Add to Cart' button" do
#         visit root_path 
#         expect(page).to have_content('My Cart (0)')
#         click_button("Add", :match => :first)
#         expect(page).to have_content('My Cart (1)')
#         save_screenshot 
#   end
# end
