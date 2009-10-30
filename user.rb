class User
  def initialize(name=nil, password=nil)
    if name
      @name = name
      @password = password
    else
      print 'Enter name: '
      @name = gets.chomp
      print 'Enter password: '
      @password = gets.chomp
    end
  end

  attr :name
  attr :password

  def change_password
    print 'Enter new password: '
    @password = gets.chomp
    puts 'Password was successfully changed.'
  end
end
