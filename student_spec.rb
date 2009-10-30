require 'student'
require 'user'

describe Student do
  before(:each) do
    @student = Student.new('Student', 'password')
  end

  it 'should be a kind of user' do
    @student.should be_kind_of(User)
  end
end
