
class OysterCard
    attr_reader :balance
  
    def initialize
      @balance = 0
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance is 90" if maximum_balance
      @balance += credit
    end 

    private 

    def maximum_balance
      return true if @balance >= 90
    end 
    

end 