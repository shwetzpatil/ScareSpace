feature 'authentication' do
  before(:each) { User.create(email: 'test@example.com', password: 'password123') }
  scenario 'a user can sign in' do
    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with:'password123')
    click_button('Log In')
    expect(page).to have_content('User: test@example.com')
  end

  scenario 'a user sees an error if the given email is wrong' do
    visit '/login'
    fill_in('email', with: 'fail@fake.com')
    fill_in('password', with:'password123')
    click_button('Log In')
    expect(page).not_to have_content('User: fail@fake.com')
    expect(page).to have_content('Incorrect email or password')
  end

  scenario 'a user sees an error if the given password is wrong' do
    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with:'wrongpassword123')
    click_button('Log In')
    expect(page).not_to have_content('User: test@example.com')
    expect(page).to have_content('Incorrect email or password')
  end

  scenario 'a user can sign out' do
    visit '/homepage'
    visit '/login'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with:'password123')
    click_button('Log In')
    click_button('Log Out')
    expect(page).not_to have_content('User: test@example.com')
    expect(page).to have_content('You have logged out')
  end
end
