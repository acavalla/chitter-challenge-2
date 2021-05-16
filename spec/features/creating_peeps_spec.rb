feature 'Creating peeps' do
  scenario 'visiting the Peeps page' do
    visit '/peeps'
    expect(page).to have_content('What would you like to peep?')
    fill_in('peep', with: 'hiya')
    click_button('Peep!')
    expect(page).not_to have_content('text:')
    expect(page).to have_content('hiya')
  end
end
