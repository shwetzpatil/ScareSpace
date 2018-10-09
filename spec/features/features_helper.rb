def db_truncate
  connection = DatabaseConnection.setup
  connection.exec('TRUNCATE users, spaces, availability;')
end

def sign_up
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Sign Up')
end
