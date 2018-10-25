# ## Test Cases
#
# elevator.requestUp(0, 1) // Rider calls from the ground level @ time unit 0
# elevator.requestFloor(1, 3) // Rider boards and requests 3rd floor
# elevator.run() // [1, 1, 3]
# elevator.getTime() // 20
#
# elevator2.requestUp(0, 2) // Rider A calls from 2nd level @ time unit 0
# elevator2.requestFloor(2, 6) // Rider A boards and requests 6th floor
# elevator2.requestDown(15, 5) // Rider B calls from 5th level @ time unit 15
# elevator2.requestFloor(5, 4) // Rider B boards and requests 4th floor
# elevator2.requestDown(41, 4) // Rider C requests from 4th floor @ time unit 41
# elevator2.requestFloor(4, 1) // Rider C boards and requests 1st floor
# elevator2.run() // [1, 2, 6, 5, 4, 1]
# elevator2.getTime() // 100

require "rspec"
require_relative "elevator.rb"

describe Elevator do
  before do
    @e1 = Elevator.new
  end
  it "has to be real" do
    expect {Elevator.new}.to_not raise_error
  end
  it "starts time at 0" do
    expect(Elevator.new.timeStamp[0]).to eq(0)
  end
  it "increases time by 10 secs per floor & gets time" do
    @e1.add_time(3)
    @e1.add_time(-1)
    expect(@e1.get_time).to eq(40)
  end
  it "can take in an up request" do
    @e1.request_up(15,4)
    expect(@e1.timeStamp[1]).to eq(15)
    expect(@e1.fromFloor[1]).to eq(4)
  end
  it "can take in an down request" do
    @e1.request_down(45,7)
    @e1.request_down(30,2)
    expect(@e1.timeStamp[2]).to eq(30)
    expect(@e1.fromFloor[2]).to eq(2)
  end
  it "can take in a floor request" do
    @e1.request_floor(7,2)
    expect(@e1.fromFloor[1]).to eq(7)
    expect(@e1.dest[1]).to eq(2)
  end
end
