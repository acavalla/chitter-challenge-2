require_relative 'web_helpers'

feature 'Creating peeps' do
  scenario 'cannot peep unless signed in' do
    visit '/peeps'
    expect(page).not_to have_content 'What would you like to peep?'
  end

  scenario 'visiting the Peeps page' do
    create_user_and_sign_in
    visit '/peeps'
    expect(page).to have_content('What would you like to peep?')
    fill_in('peep', with: 'hiya')
    click_button('Peep!')
    expect(page).not_to have_content('text:')
    expect(page).to have_content('hiya')
  end
end
