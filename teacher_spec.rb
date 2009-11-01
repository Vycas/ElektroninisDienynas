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

  it 'should be able to set default course' do
    should_have_command(:default_course)
    @teacher.add_course('Math')
    @teacher.default_course('Math')
  end

  it 'should be able to assign student to courses' do
    should_have_command(:assign_student)
    student = Student.new('John', 'password')
    User.add(student)
    @teacher.add_course('Math')
    @teacher.assign_student('John', 'Math')
    @teacher.courses.keys.should include('Math')
    @teacher.courses['Math'].marks.keys.should include('John')
    User.users['John'].marks.keys.should include('Math')
    User.remove('John')
  end

  it 'should be able to remove students from the course' do
    should_have_command(:remove_student)
    student = Student.new('John', 'password')
    User.add(student)
    @teacher.add_course('Math')
    @teacher.assign_student('John', 'Math')
    @teacher.remove_student('John', 'Math')
    @teacher.courses.keys.should include('Math')
    @teacher.courses['Math'].marks.keys.should_not include('John')
    User.users['John'].marks.keys.should_not include('Math')
    User.remove('John')
  end

  it 'should be able to list assigned to courses students and their marks' do
    should_have_command(:list_students)
    @teacher.add_course('Math')
    @teacher.list_students('Math').should be_kind_of(String)
  end

  it 'should be able to enter new marks' do
    should_have_command(:enter)
    student = Student.new('John', 'password')
    User.add(student)
    @teacher.add_course('Math')
    @teacher.assign_student('John', 'Math')
    @teacher.enter('John', 9, 'Math')
    @teacher.courses['Math'].marks['John'][0].value == 9
    User.users['John'].marks['Math'][0].value == 9
    User.remove('John')
  end
end
