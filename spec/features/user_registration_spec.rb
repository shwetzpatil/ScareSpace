feature 'user registration' do
  before(:each) do
    connection = DatabaseConnection.setup
    connection.query('TRUNCATE users, spaces, availability;')
  end
  scenario 'a user should be able to sign up' do
    visit('/signup')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content 'User: test@example.com'
  end

  scenario 'a user can only sign up with a unique email' do
    visit('/signup')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    click_button('Log Out')
    click_button('Sign Up')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).not_to have_content 'User: test@example.com'
    expect(page).to have_content 'Email already in use, please use another email'
  end
end
