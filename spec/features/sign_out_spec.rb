feature 'Signing out' do
  scenario 'User on peeps page clicks sign out' do
    visit '/peeps'
    click_link("Sign out")
  end
end
