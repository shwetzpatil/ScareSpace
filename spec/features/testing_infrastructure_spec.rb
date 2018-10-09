feature 'Testing infrastructure' do
  scenario 'can run app and check page content' do
    visit('/homepage')
    expect(page).to have_content 'Welcome to ScareSpace'
  end
end
