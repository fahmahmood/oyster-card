require 'journeylog'

class Oystercard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1

 attr_reader :journey, :balance, :log


 def initialize(log=JourneyLog.new)
  		@balance = 0
      @log = log
      
  end

  def top_up(amount)
  	fail 'Maximum balance of #{maximum_balance} exceeded' if amount + @balance > MAXIMUM_BALANCE
  	@balance += amount
  end



  def touch_in(station)
  
    #FILL CODE HERE TO CHECK IF YOU ARE ALREADY IN A JOURNEY
    #if you are....(you need to)
    # charges a penalty for incomplete journey
    # finishes that journey (so you can move on)
    fail "Insufficient funds!" if @balance < MINIMUM_BALANCE
    log.start(station)
  end

  def touch_out(station)
    #IF BLOCK


    #ERROR if a journey is not in progress and you try to touch out
    #(i.e you snuck into the tube!)
    #you need to start a journey (you have a new but incomplete journey)
    # call for the fare (which will come up with a penalty because we didnt finish it)
    #log.finish(station) #SO YOU CAN FINISH THE TRIP AND GET OUT
    
    #ELSE BLOCK
    log.finish(station)
    deduct 
    
  end

private

attr_writer :balance


  def deduct
    @balance -= log.fare 
  end



end