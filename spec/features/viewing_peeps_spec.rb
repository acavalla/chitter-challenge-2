require './lib/database_connection'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('Peeps')
  end

  scenario 'visiting the Peeps page' do
    con = DatabaseConnection.setup('chitter_test')
    con.query("INSERT INTO peeps (text) VALUES('Covfefe');")
    con.query("INSERT INTO peeps (text) VALUES('First Peep :)');")
    con.query("INSERT INTO peeps (text) VALUES('Way better than Twitter');")
    visit '/peeps'
    expect(page).to have_content('Covfefe')
    expect(page).to have_content('First Peep')
    expect(page).to have_content(Time.now.strftime('%H:%M, %b %d %Y'))
  end
end
