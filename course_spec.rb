require 'course'
require 'teacher'

describe Course do
  before(:each) do
    teacher = Teacher.new('Teacher', 'password')
    @course = Course.new(teacher, 'Math', 'Science of numbers', 'Monday 8.00')
  end

  it 'should have title' do
    @course.should respond_to(:title)
  end

  it 'should have description' do
    @course.should respond_to(:description)
  end

  it 'should have time' do
    @course.should respond_to(:time)
  end

  it 'should have assigned teacher' do
    @course.should respond_to(:teacher)
    @course.teacher.should be_instance_of(Teacher)
  end

  it 'should be able to access student marks' do
    @course.should respond_to(:marks)
    @course.marks.should be_instance_of(Hash)
  end
end
