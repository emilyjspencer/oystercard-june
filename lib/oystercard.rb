
class OysterCard
    attr_reader :balance

    MAXIMUM_BALANCE = 90

  
    def initialize
      @balance = 0
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeded?(credit)
      @balance += credit
    end 

    def deduct(credit)
      @balance -= credit
    end 

    private

    def exceeded?(credit)
      return true if @balance + credit > MAXIMUM_BALANCE
    end 

    
    

end 