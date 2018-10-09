feature 'user registration' do
  scenario 'a user should be able to sign up' do
    visit('/signup')
    sign_up
    expect(page).to have_content 'User: test@example.com'
  end

  scenario 'a user can only sign up with a unique email' do
    visit('/signup')
    sign_up
    click_button('Log Out')
    click_button('Sign Up')
    sign_up
    expect(page).not_to have_content 'User: test@example.com'
    expect(page).to have_content 'Email already in use, please use another email'
  end
end
