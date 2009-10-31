require 'mark'
require 'date'
require 'teacher'
require 'course'

describe Mark do
  before(:each) do
    @mark = Mark.new(10, Date.today)
  end

  it 'should have value of integer in range 1-10 or string "n"' do
    @mark.should respond_to(:value)
    if @mark.value.kind_of? Fixnum
      (1..10).should include(@mark.value)
    elsif @mark.value.kind_of? String
      @mark.value.should == "n"
    else
      True.should be_false
    end
  end

  it 'should have its date' do
    @mark.should respond_to(:date)
    @mark.date.should be_instance_of(Date)
  end

  it 'should be able to change its value' do
    @mark.should respond_to(:value=)
  end

  it 'should be able to change its date' do
    @mark.should respond_to(:date=)
  end

  it 'should be able to express mark with string "value [yyyy-mm-dd]"' do
    @mark.to_s.should match('(10|[1-9]|n) \[\d{4}-\d{2}-\d{2}\]')
  end
end

describe Marks do
  before(:each) do
    teacher = Teacher.new('Teacher', 'password')
    student = Student.new('Student', 'password')
    course = Course.new(teacher, 'Math', 'Science of numbers', 'Monday 8.00')
    @marks = Marks.new(course, student)
  end

  it 'should be a kind of array' do
    @marks.should be_kind_of(Array)
  end

  it 'should have student' do
    @marks.should respond_to(:student)
  end

  it 'should have course' do
    @marks.should respond_to(:course)
  end
end
