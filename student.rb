require 'User'

class Student < User
  def initialize(name, password)
    super(name, password)
    @marks = {}
  end

  def commands
    [:help, :change_password]
  end

  attr :marks, true
end
