require 'date'

class Mark
  def initialize(value, date=Date.today)
    @value = value
    @date = date
  end

  attr :value, true
  attr :date, true

  def to_s
    "#{@value} [#{@date}]"
  end
end


class Marks < Array
  def initialize(course, student)
    @course = course
    @student = student
  end

  attr :course, true
  attr :student, true
end
