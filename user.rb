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

  def change_password(password=nil)
    if password
      @password = password
    else
      print 'Enter new password: '
      @password = gets.chomp
    end
    puts 'Password was successfully changed.'
  end

  @users = {}
  class << self
    attr :users
  end

  def User.add(user)
    if @users.keys.include? user.name
      raise "User #{user.name} already exists"
    else
      @users[user.name] = user
    end
  end

  def User.remove(username)
    if @users.keys.include? username
      @users.delete(username)
    else
      raise "User #{username} doesn't exist"
    end
  end
end
