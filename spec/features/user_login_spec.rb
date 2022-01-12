require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
   # SETUP
   before :each do
    User.create!(
      first_name:"Ftest",
      last_name:"Ltest",
      email:"test@test.com", 
      password:"12345"
    )
  end
  scenario "authenticated user can login" do    
    # ACT
    visit login_path

    # VERIFY
    fill_in'email', with:'test@test.com'
    fill_in'password', with:'12345'

    click_button('Submit')

    expect(page).to have_content('Logout')

    # DEBUG
    save_screenshot
  end
end