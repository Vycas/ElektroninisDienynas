require 'admin'
require 'user'
require 'student'

describe Admin, '(System administrator)' do
  before(:each) do
    @admin = Admin.new('Administrator', 'password')
  end

  it 'should be a kind of user' do
    @admin.should be_kind_of(User)
  end

  it 'should be able to add new student' do
    @admin.should respond_to(:add_student)
    student = Student.new('Student', 'password')
    @admin.add_student(student)
    User.users.values.should include(student)
  end

  it 'should be able to add new teacher' do
    @admin.should respond_to(:add_teacher)
    teacher = Teacher.new('Teacher', 'password')
    @admin.add_teacher(teacher)
    User.users.values.should include(teacher)
  end

  it 'should be able to remove users' do
    @admin.should respond_to(:remove_user)
    user = User.new('User', 'password')
    User.add(user)
    @admin.remove_user('User')
    User.users.values.should_not include(user)
  end

  it 'should be able to change other users passwords' do
    @admin.should respond_to(:change_user_password)
    user = User.new('User', 'password')
    User.add(user)
    @admin.change_user_password('User', 'newPassword')
    user.password.should == 'newPassword'
  end
end
