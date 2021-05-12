feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('Peeps')
  end

  scenario 'visiting the Peeps page' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES('Covfefe');")
    connection.exec("INSERT INTO peeps (text) VALUES('First Peep :)');")
    connection.exec("INSERT INTO peeps (text) VALUES('Way better than Twitter');")
    visit '/peeps'
    expect(page).to have_content('Covfefe')
    expect(page).to have_content('First Peep')
  end
end
