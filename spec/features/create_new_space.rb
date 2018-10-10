feature 'create new space' do
  scenario 'adds space details' do
    sign_up
    visit('/spaces')
    fill_in('name_of_space', with: 'test-space')
    fill_in('address_of_space', with: 'test-address')
    fill_in('price_of_space', with: '100')
    fill_in('description_of_space', with: 'test-description')
    # click_button('Create space')
    # click_button('Logout')
    # sign_up_2
    expect(page).to have_content('You have created a space')
  end
end