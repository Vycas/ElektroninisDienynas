require 'admin'
require 'user'

describe Admin, '(System administrator)' do
  before(:each) do
    @admin = Admin.new('Administrator', 'password')
  end

  it 'should be a kind of user' do
    @admin.should be_kind_of(User)
  end
end
