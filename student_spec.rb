require 'student'
require 'user'

describe Student do
  before(:each) do
    @student = Student.new('Student', 'password')
  end

  def should_have_command(command)
    @student.should respond_to(command)
    @student.commands.should include(command)
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
end
