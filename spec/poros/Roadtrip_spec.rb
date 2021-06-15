require 'rails_helper'

RSpec.describe 'Roadtrip' do
  describe 'it encapsulates and returns trip data' do
    it 'shows trip attributes' do
      origin = "Denver, CO"
      destination = "New York, NY"
      time_clean = "26:16:46"
      weather = {:temperature=>72.91, :conditions=>"clear sky"}
      trip = Roadtrip.new(origin, destination, time_clean, weather)
      expect(trip).to be_a(Roadtrip)
      expect(trip.start_city).to eq("Denver, CO")
      expect(trip.end_city).to eq("New York, NY")
      expect(trip.travel_time).to eq("26:16:46")
      expect(trip.weather_at_eta).to eq({:temperature=>72.91, :conditions=>"clear sky"})
    end
  end
end
