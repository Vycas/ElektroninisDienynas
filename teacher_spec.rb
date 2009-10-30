require 'teacher'
require 'user'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Teacher', 'password')
  end

  it 'should be a kind of user' do
    @teacher.should be_kind_of(User)
  end
end
