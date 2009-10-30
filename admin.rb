require 'user'
require 'student'
require 'teacher'

class Admin < User
  def add_student(student=nil)
    student = Student.new unless student
    User.add(student)
  end

  def add_teacher(teacher=nil)
    teacher = Teacher.new unless teacher
    User.add(teacher)
  end
end
