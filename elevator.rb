# ## Requirements:
# [ ] The elevator must work on a building with any number of floors
# [ ] The elevator takes 10 seconds to travel one floor - count seconds as integers
# [ ] An elevator can be called from any floor on the building, and the rider will specify if they are going up or down.
# [ ] A rider will call the elevator by calling the method elevator.requestUp(int time, int fromFloor) or elevator.requestDown(int time, int fromFloor)
# [ ] Once inside the elevator, the rider can request any specific floor number.
# [ ] The method call for this request will be elevator.requestFloor(int fromFloor, int toFloor)
# [ ] If a rider is going to make a request for a particular floor, assume the request occurs at the same time unit the elevator arrived on the floor

# [ ] You need to implement the method that decides the routing. The elevator should service all requested operations in a timely manner and not make extraneous stops.
# [ ] Your program will be initialized with a series of steps and then called via elevator.run(). You can assume that the elevator knows all requests that are going to be made for it at the time the run method is called. When the program runs, it should return an array of the order of the floors that the elevator went in, with the first floor being in the 0 index.
# [ ] After running, elevator.getTime() should return the total elapsed time required to service all requests.

class Elevator
  attr_accessor :timeStamp, :fromFloor, :dest
  def initialize
    @timeStamp = [0]
    @fromFloor = [0]
    @dest = [0]
  end
  def add_time(numFloors) # numFloors should = dest - fromFloor
    @timeStamp[0] += (10 * numFloors.abs)
  end
  def request_up(timeStamp, fromFloor)
    @timeStamp << timeStamp
    @fromFloor << fromFloor
  end

  def request_down(timeStamp, fromFloor)
    @timeStamp << timeStamp
    @fromFloor << fromFloor
  end

  def request_floor(fromFloor, dest)
    @dest << dest
  end
  def get_time
    @timeStamp[0]
  end
  def elevator_run
    #first look at timestamp arrays, then lowest fromFloor
    @timeStamp = @timeStamp.sort
    @fromFloor = @fromFloor.sort
  end # return array of stops (fromFloors & dests)
end

elevator = Elevator.new
elevator.request_up(10,7) #second,fromFloor
elevator.request_floor(7,1)#fromFloor,dest
elevator.request_up(5,6) #second,fromFloor
elevator.request_floor(6,2) #fromFloor,dest
elevator.request_up(13,6) #second,fromFloor
elevator.request_floor(6,4) #fromFloor,dest
puts elevator.timeStamp
p "___________"
puts elevator.fromFloor
elevator.elevator_run
p "___________"
puts elevator.timeStamp
p "___________"
puts elevator.fromFloor
