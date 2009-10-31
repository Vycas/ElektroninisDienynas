require 'admin'
require 'user'
require 'student'

describe Admin, '(System administrator)' do
  before(:each) do
    @admin = Admin.new('Administrator', 'password')
  end

  def should_have_command(command)
    @admin.should respond_to(command)
    @admin.commands.should include(command)
  end

  it 'should be a kind of user' do
    @admin.should be_kind_of(User)
  end

  it 'should have a list of available commands' do
    @admin.should respond_to(:commands)
    @admin.commands.should be_instance_of([].class)
  end

  it 'should have help command' do
    should_have_command(:help)
  end

  it 'should be able to add new student' do
    should_have_command(:add_student)
    student = Student.new('Student', 'password')
    @admin.add_student(student)
    User.users.values.should include(student)
  end

  it 'should be able to add new teacher' do
    should_have_command(:add_teacher)
    teacher = Teacher.new('Teacher', 'password')
    @admin.add_teacher(teacher)
    User.users.values.should include(teacher)
  end

  it 'should be able to remove users' do
    should_have_command(:remove_user)
    user = User.new('User', 'password')
    User.add(user)
    @admin.remove_user('User')
    User.users.values.should_not include(user)
  end

  it 'should be able to change other users passwords' do
    should_have_command(:change_user_password)
    user = User.new('User', 'password')
    User.add(user)
    @admin.change_user_password('User', 'newPassword')
    user.password.should == 'newPassword'
  end

  it 'should be able to list all registered users' do
    should_have_command(:list_users)
  end
end
