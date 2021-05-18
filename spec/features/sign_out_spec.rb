require_relative 'web_helpers'

feature 'Signing out' do
  scenario 'User on peeps page clicks sign out' do

    visit '/peeps'
    expect(page).not_to have_content("Sign out")
    create_user_and_sign_in
    expect(page).to have_content("Sign out")
    click_link("Sign out")
    expect(current_path).to eq ('/session/new')
  end
end
