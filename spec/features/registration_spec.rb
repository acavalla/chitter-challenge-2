feature 'Registering a new user' do
  scenario 'visit /users/new and fill in the form' do
    visit '/users/new'
    expect(page).to have_content('Please sign up to use Chitter')
    fill_in('email', with: 'acav@gmail.com')
    fill_in('password', with: 'password')
    click_button('Sign me up!')
    expect(page).to have_content('Thanks for signing up, Acav')
  end
end
