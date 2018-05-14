class Point
  attr_accessor :gml_id, :lat, :lon, :alt
  def initialize(gml_id, lat, lon, alt = 0.0)
    @gml_id = gml_id
    @lat = lat
    @lon = lon
    @alt = alt
  end 

  def to_s
    "<Point [ID: #{@gml_id} "\
    "LAT: #{@lat} "\
    "LON: #{@lon} "\
    "ALT: #{@alt} "
  end
end