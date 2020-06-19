require_relative 'station'
require_relative 'journey'

class OysterCard
    attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history, :journey

    MAXIMUM_BALANCE = 90
    MINIMUM_BALANCE = 1

  
    def initialize(journey_class: Journey)
      @journey = nil
      @balance = 0
      @entry_station = entry_station
      @exit_station = exit_station
      @journey_history = []
      @journey_class = journey_class
    end 

    def add(credit)
      fail "Unable to add credit. Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeded?(credit)
      @balance += credit
    end 


    def touch_in(entry_station)
      fail "Unable to touch in. Minimum of 1 pound credit required" unless deceded?
      touch_in_deduct unless @journey.nil?
      start_journey(entry_station)
    end 

    def touch_out(exit_station)
      no_entry if @journey.nil?
      @journey.end(exit_station)
      deduct(@journey.fare)
      save_journey
      
     
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


    def deduct(credit)
      @balance -= credit
    end 
    
    def touch_in_deduct
      deduct(@journey.fare)
      save_journey
    end 

    def no_entry
      @journey = @journey_class.new
    end 

    def start_journey(entry_station)
      @journey = @journey_class.new
      @journey.start(entry_station)
    end
    
    def save_journey
      @journey_history.push(@journey)
      @journey = nil
    end 
    
    

end 