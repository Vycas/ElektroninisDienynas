require 'user'

describe User do
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
end
