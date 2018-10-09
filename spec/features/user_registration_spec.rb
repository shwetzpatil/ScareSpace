feature 'user registration' do
  scenario 'a user should be able to sign up' do
    visit('/signup')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content 'User: test@example.com'
  end

  xscenario 'a user can only sign up with a unique email' do
    before(:each) { User.create(email: 'test@example.com', password: 'password123') }

    visit('/signup')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).not_to have_content 'User: test@example.com'
    expect(page).to have_content 'Email already in use, please use another email'
  end
end
