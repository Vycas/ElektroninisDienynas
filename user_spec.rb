require 'user'

describe User, 'as a person' do
  before(:each) do
    @user = User.new('John', 'secret')
  end

  it 'should have name' do
    @user.should respond_to(:name)
  end

  it 'should have password' do
    @user.should respond_to(:password)
  end

  it 'should be able to change password' do
    @user.should respond_to(:change_password)
  end

  it 'should NOT be able to change user name' do
    @user.should_not respond_to(:name=)
  end
end

describe User, 'as a users storage' do
  before(:all) do
    user = User.new('John', 'secret')
    User.add(user)
  end

  it 'should be able to add new users' do
    User.should respond_to(:add)
  end

  it 'should NOT be able to add new user having name which already exists' do
    user = User.new('John', 'password')
    lambda {User.add(user)}.should raise_error
  end

  it 'should be able to remove users' do
    User.should respond_to(:remove)
  end

  it 'should NOT be able to remove non-existing users' do
    lambda {User.remove('NonExistingUser')}.should raise_error
  end

  it 'should be able to access users list' do
    User.should respond_to(:users)
  end
end
