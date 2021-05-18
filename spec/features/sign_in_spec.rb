require_relative 'web_helpers'

feature 'Signing in' do
  scenario 'Users can sign in' do
    sign_up
    visit '/session/new'
    expect(page).to have_content('Please sign in')
    fill_in('email', with: 'acav@gmail.com')
    fill_in('password', with: 'password')
    click_button('Sign me in!')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Welcome, acav')
  end

  scenario 'Wrong credentials lead to flash notif' do
    sign_up
    visit '/session/new'
    expect(page).to have_content('Please sign in')
    fill_in('email', with: 'acav@gnail.com')
    fill_in('password', with: 'password')
    click_button('Sign me in!')
    expect(current_path).to eq '/session/new'
    expect(page).to have_content('Incorrect credentials')
  end
end
