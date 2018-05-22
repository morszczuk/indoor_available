class RouteMember
  attr_accessor :route_segments
  def initialize(route_segments)
    @route_segments = route_segments || []
  end
end