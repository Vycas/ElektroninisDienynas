require 'teacher'
require 'user'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Teacher', 'password')
  end

  def should_have_command(command)
    @teacher.should respond_to(command)
    @teacher.commands.should include(command)
  end

  it 'should be a kind of user' do
    @teacher.should be_kind_of(User)
  end

  it 'should have a list of available commands' do
    @teacher.should respond_to(:commands)
    @teacher.commands.should be_instance_of([].class)
  end

  it 'should be able to add new courses' do
    should_have_command(:add_course)
  end

  it 'should be able to remove courses' do
    should_have_command(:remove_course)
  end

  it 'should be able to list registered courses' do
    should_have_command(:list_courses)
  end
end
