require 'User'

class Student < User
  def initialize(name, password)
    super(name, password)
    @marks = {}
  end

  def commands
    [:help, :change_password, :get]
  end

  def help
    out =  "Available commands:\n"
    out << "  change_password <password> - to change your password\n"
    out << "  get - to get a table of marks\n"
  end

  attr :marks, true

  def get
    out = ''
    @marks.each_pair do |course, marks|
      out << "#{course} [#{marks.course.teacher.name}] - #{marks.to_s}"
    end
    out
  end
end
