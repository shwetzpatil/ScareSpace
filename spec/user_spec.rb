describe User do
  describe '.create' do
    it 'creates a new user' do
      new_user = User.create(email: 'test@example.com', password: 'password123')

      expect(new_user).to be_a User
      expect(new_user).to respond_to :id
      expect(new_user.email).to eq 'test@example.com'
    end

    it('hashes the password using BCrypt') do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end

    it 'returns nil when given a duplicate email' do
      User.create(email: 'test@example.com', password: 'password123')

      duplicate_user = User.create(email: 'test@example.com', password: 'password1234')

      expect(duplicate_user).not_to be_a User
      expect(duplicate_user).to be_nil
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    before(:each) { @user = User.create(email: 'test@example.com', password: 'password123')}
    it 'returns a user given a correct username and password, if one exists' do
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq @user.id
    end

    it 'returns nil when given an incorrect email address' do
      expect(User.authenticate(email: 'fakeemail@example.com', password: 'password123')).to be_nil
    end

    it 'returns nil when given an incorrect password' do
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword123')).to be_nil
    end
  end
end
