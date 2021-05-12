feature 'Creating peeps' do
  scenario 'visiting the Peeps page' do
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (text) VALUES('Covfefe');")
    # connection.exec("INSERT INTO peeps (text) VALUES('First Peep :)');")
    # connection.exec("INSERT INTO peeps (text) VALUES('Way better than Twitter');")
    visit '/peeps'
    expect(page).to have_content('What would you like to peep?')
    fill_in('peep', with: 'hiya')
    click_button('Peep!')
    expect(page).not_to have_content('text')
    expect(page).to have_content('hiya')

  end
end
