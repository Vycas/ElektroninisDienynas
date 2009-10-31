require 'user'
require 'student'
require 'teacher'

class Admin < User
  def commands
    [:help, :add_student, :add_teacher, :remove_user, 
     :change_password, :change_user_password, :list_users]
  end

  def help
    puts 'Available commands (item in < > are optional):'
    puts '  add_student - to add new student'
    puts '  add_teacher - to add new teacher'
    puts '  remove_user username - to remove user'
    puts '  change_user_password username <password> - to change user\'s password'
    puts '  change_password - to change your password'
    puts '  list_users - to get list of users'
  end

  def add_student(student=nil)
    student = Student.new unless student
    User.add student
  end

  def add_teacher(teacher=nil)
    teacher = Teacher.new unless teacher
    User.add teacher
  end

  def remove_user(username)
    User.remove username
  end

  def change_user_password(username, password=nil)
    if not User.users.keys.include? username
      raise "User #{username} doesn't exist"
    end
    User.users[username].change_password(password)
  end

  def list_users
    puts 'Registered users:'
    User.users.values.each { |u| puts u.name + ' - ' + u.class.to_s }
  end
end
