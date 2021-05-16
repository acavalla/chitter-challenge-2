feature 'Deleting peeps' do
  scenario 'from the Peeps feed' do
    peep = Peep.create(text:'Dummy peep')
    visit '/peeps'
    # expect(page).to have_text('Delete')
    click_on('Delete')
    expect(page).not_to have_content('Dummy peep')
  end
end
