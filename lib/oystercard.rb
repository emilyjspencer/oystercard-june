
class OysterCard
    attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

  
    def initialize
      @in_journey = false
      @balance = 0
      @entry_station = entry_station
      @exit_station = exit_station
      @journey_history = []
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeded?(credit)
      @balance += credit
    end 


    def touch_in(entry_station)
      fail "Unable to touch in. Minimum of 1 pound credit required" unless deceded?
      fail "Already in journey" if in_journey?
      @entry_station = entry_station 
      @in_journey = true
    end 

    def touch_out(exit_station)
      fail "Card not in use" if !in_journey?
      deduct(MINIMUM_BALANCE)
      @exit_station = exit_station
      @journey_history.push({ entry: @entry_station, exit: @exit_station })
      @entry_station = nil
      @in_journey = false
      
     
    end 

    def in_journey?
      @entry_station? true : false 
    end   

    private

    def exceeded?(credit)
      return true if @balance + credit > MAXIMUM_BALANCE
    end 

    def deceded?
      return true if @balance >= MINIMUM_BALANCE
    end 

    private

    def deduct(credit)
      @balance -= credit
    end 
    
    

end 