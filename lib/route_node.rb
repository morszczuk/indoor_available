class RouteNode
  attr_accessor :gml_id
  def initialize(gml_id, point)
    @gml_id = gml_id
    @point = point
  end

  def to_s
    "<RouteNode [gml_id: #{@gml_id}][point: #{@point.to_s}]>"
  end
end