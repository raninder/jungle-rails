# require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature, js: true do 
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

#   scenario "They can navigate from the home page to the product detail page" do
#     visit root_path
#     first('.product').click_link('Details')  # or click_link 'Details' if rendering only one product 

#     # DEBUG / VERIFY
#     expect(page).to have_css 'article.product-detail'  # or expect(page).to have_content('Description')
    
#     save_screenshot
#   end
# end
