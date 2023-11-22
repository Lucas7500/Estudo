require_relative 'client'

class Account
  attr_reader :holder, :number
  attr_accessor :balance

  def initialize(holder, number, balance)
    @holder = holder
    @number = number
    @balance = balance
  end

  def withdraw(value)
    if balance >= value
      self.balance -= value # @balance works too
    else
      puts "You doesn't have this amount of money in your bank account"
    end
  end

  def deposit(value)
    self.balance += value
  end

  def transfer(dest_account, value)
    return if withdraw(value).nil?


    dest_account.deposit(value)
  end
end
