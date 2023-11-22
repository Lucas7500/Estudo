require_relative 'account'

class CurrentAccount < Account
  attr_accessor :limit

  def initialize(holder, number, balance, limit)
    super(holder, number, balance)
    @limit = limit
  end

  def withdraw(value)
    if (balance + limit) >= value
      self.balance -= value # @balance works too
    else
      puts "You doesn't have enough limit to do this withdraw"
    end
  end
end
