require 'user'

class Teacher < User
  def initialize(name, password)
    super(name, password)
    @courses = {}
  end

  def commands
    [:help, :change_password, :add_course, :remove_course, :list_courses]
  end

  def help
    out =  "Available commands:\n"
    out << "  add_course <title> [<description>] [<time>] - to add new course\n"
    out << "  remove_course <title> - to remove existing course\n"
    out << "  list_courses - to list existing courses\n"
    out << "  change_password <password> - to change your password\n"
  end

  def add_course(title, description=nil, time=nil)
    if @courses.keys.include? title
      raise "Course #{title} already exists."
    else
      @courses[title] = Course.new(self, title, description, time)
    end
  end

  def remove_course(title)
    if @courses.keys.include? title
      @courses.delete title
    else
      raise "Course #{title} doesn't exist."
    end
  end

  def list_courses
    out = ""
    @courses.values.each { |c| out << c.to_s + "\n" }
    out
  end
end
