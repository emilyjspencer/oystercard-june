class Journey
    attr_reader :in_journey

  def initialize
    @in_journey = false
  end

  def start
    @in_journey = true
  end 

  def end
    @in_journey = false
  end 



end 