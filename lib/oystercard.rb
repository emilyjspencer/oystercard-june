
class OysterCard
    attr_reader :balance
  
    def initialize
      @balance = 0
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance is 90" if @balance >= 90
      @balance += credit
    end 


end 