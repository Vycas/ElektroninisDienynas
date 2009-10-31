class Course
  def initialize(teacher, title, description=nil, time=nil)
    @teacher = teacher
    @title = title
    @description = description
    @time = time
  end

  attr_reader :title, :description, :time, :teacher

  def to_s
    "#{@title} - #{@description} [#{@time}]"
  end
end
