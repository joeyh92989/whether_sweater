class LatLong
  attr_reader :lat,
              :long,
              :destination

  def initialize(location_info)
    @lat = location_info[:results][0][:locations][0][:latLng][:lat]
    @long = location_info[:results][0][:locations][0][:latLng][:lng]
    @destination = location_info[:results][0][:providedLocation][:location]
  end
end
