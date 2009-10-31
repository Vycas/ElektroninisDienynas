require 'user'

class Teacher < User
  def initialize(name, password)
    super(name, password)
    @courses = {}
  end

  def commands
    [:change_password, :add_course, :remove_course, :list_courses]
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
    output = ''
    @courses.values.each { |c| output += c.to_s + '\n' }
    output
  end
end
