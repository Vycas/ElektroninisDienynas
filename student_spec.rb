require 'student'
require 'user'
require 'matchers'

describe Student do
  before(:each) do
    @student = Student.new('Student', 'password')
  end

  it 'should be a kind of user' do
    @student.should be_kind_of(User)
  end

  it 'should have a list of available commands' do
    @student.should respond_to(:commands)
    @student.commands.should be_instance_of(Array)
  end

  it 'should be able from outside to access and change its marks' do
    @student.should respond_to(:marks)
    @student.should respond_to(:marks=)
  end

  it 'should be able to get a table of marks' do
    @student.should have_command(:get)
    @student.get.should be_instance_of(String)
  end
end
