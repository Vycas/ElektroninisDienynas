class Course
  def initialize(teacher, title=nil, description=nil, time=nil)
    if title
      @title = title
      @description = description
      @time = time
    else
      puts 'Enter course title: '
      @title = gets.chomp
      puts 'Enter course description: '
      @description = gets.chomp
      puts 'Enter course time: '
      @time = gets.chomp
    end
    @teacher = teacher
  end

  attr_reader :title, :description, :time, :teacher

  def to_s
    "#{@title} - #{@description} [#{@time}]"
  end
end
