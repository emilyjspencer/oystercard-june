class Journey

    MINIMUM_FARE = 1
    PENALTY_FARE = 6

    attr_reader :in_journey, :stations_passed, :fare


  def initialize
    @in_journey = false
    @fare = PENALTY_FARE
    @stations_passed = { entry: nil, exit: nil }
  end

  def start(entry)
    @in_journey = true
    @stations_passed[:entry] = entry
  end 

  def end(exit)
    @in_journey = false
    @stations_passed[:exit] = exit
    calculate_fare
  end 

  def incomplete?
    @stations_passed[:entry].nil?  || @stations_passed[:exit].nil?
  end
  
 

  def calculate_fare
    incomplete? ? @fare = PENALTY_FARE : @fare = MINIMUM_FARE
  end 



end 