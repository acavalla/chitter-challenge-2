feature 'Deleting peeps' do
  scenario 'from the Peeps feed' do
    Peep.create(text: 'Dummy peep')
    visit '/peeps'
    click_on('Delete')
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Dummy peep')
  end
end
