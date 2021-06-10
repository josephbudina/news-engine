require 'rails_helper'

RSpec.describe FlightsFacade, type: :model do

  describe "#flight_object" do
    it "should create flight object with attributes", :vcr do
      result = FlightsFacade.flight_object("NYC", "LAX", 1, "2021-06-17")

      expect(result.class).to eq(Array)
      expect(result[0].bookable_seats).to eq(9)
      expect(result[0].arrival).to eq({:at=>"2021-06-17T18:49:00", :iataCode=>"LAX", :terminal=>"5"})
      expect(result[0].departure).to eq({:at=>"2021-06-17T12:20:00", :iataCode=>"EWR", :terminal=>"A"})
      expect(result[0].id).to eq("1")
      expect(result[0].last_ticketing_date).to eq( "2021-06-10")
      expect(result[0].number_of_stops).to eq(0)
      expect(result[0].price).to eq("$112.62")
    end
  end
end