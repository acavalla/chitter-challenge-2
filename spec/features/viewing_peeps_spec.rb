feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('Peeps')
  end

  scenario 'visiting the Peeps page' do
    visit '/peeps'
    expect(page).to have_content('Covfefe')
    expect(page).to have_content('2021-05-12 11:59:45')
  end
end
