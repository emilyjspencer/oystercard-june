
class OysterCard
    attr_reader :balance
  
    def initialize
      @balance = 0
    end 

    def add(credit)
      @balance += credit
    end 


end 