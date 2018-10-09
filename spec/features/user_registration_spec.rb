feature 'user registration' do
  scenario 'a user should be able to sign up' do
    visit('/signup')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content 'User: test@example.com'
  end
end
