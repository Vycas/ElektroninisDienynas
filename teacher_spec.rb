require 'teacher'
require 'user'
require 'course'

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
    @teacher.commands.should be_instance_of(Array)
  end

  it 'should be able to access its courses' do
    @teacher.should respond_to(:courses)
    @teacher.courses.should be_instance_of(Hash)
  end

  it 'should be able to add new courses' do
    should_have_command(:add_course)
    @teacher.add_course("Math", "Science of numbers", "Monday 8.00")
    @teacher.courses.keys.should include("Math")
  end

  it 'should be able to remove courses' do
    should_have_command(:remove_course)
    @teacher.add_course("Math", "Science of numbers", "Monday 8.00")
    @teacher.remove_course("Math")
    @teacher.courses.should_not include("Math")
  end

  it 'should be able to list registered courses' do
    should_have_command(:list_courses)
    @teacher.list_courses.should be_instance_of(String)
  end
end
