require 'mark'
require 'date'
require 'teacher'
require 'course'

describe Mark do
  before(:each) do
    @mark = Mark.new(10, Date.today)
  end

  it 'should have value of integer in range 1-10 or string "n" or "p"' do
    @mark.should respond_to(:value)
    [(1..10).to_a, 'p', 'n'].flatten.each do |v|
      lambda { Mark.new(v) }.should_not raise_error
    end
    (('a'..'z').to_a - ['p', 'n']).each do |v|
      lambda { Mark.new(v) }.should raise_error
    end
    ((-100..100).to_a - (1..10).to_a).each do |v|
      lambda { Mark.new(v) }.should raise_error
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

  it 'should be able to get marks average' do
    @marks.should respond_to(:average)
    @marks << Mark.new(6)
    @marks << Mark.new(10)
    @marks << Mark.new(7)
    @marks.average.should be_close((6+10+7)/3.0, 0.01)
  end

  it 'should be able to get n count' do
    @marks.should respond_to(:n_count)
    count = rand(10).to_i + 1
    count.times { @marks << Mark.new('n') }
    @marks.n_count.should == count
  end

  it 'should be able to get p count' do
    @marks.should respond_to(:p_count)
    count = rand(10).to_i + 1
    count.times { @marks << Mark.new('p') }
    @marks.p_count.should == count
  end

  it 'should be able to provide marks string' do
    @marks.should respond_to(:to_s)
    @marks.to_s.should be_instance_of(String)
  end
end
