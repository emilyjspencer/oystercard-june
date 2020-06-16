
class OysterCard
    attr_reader :balance, :in_journey

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

  
    def initialize
      @in_journey = false
      @balance = 0
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeded?(credit)
      @balance += credit
    end 

    def deduct(credit)
      @balance -= credit
    end 

    def touch_in
      fail "Unable to touch in. Minimum of 1 pound credit required" unless @balance >= MINIMUM_BALANCE
      @in_journey = true
    end 

    def touch_out
      @in_journey = false
    end 

    private

    def exceeded?(credit)
      return true if @balance + credit > MAXIMUM_BALANCE
    end 

    
    

end 