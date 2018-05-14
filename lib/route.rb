class Route
  attr_accessor :route_nodes, :start_route_node, :end_route_node, :path
  def initialize(gml_id, route_nodes, start_route_node, end_route_node, path)
    @gml_id = gml_id
    @route_nodes = route_nodes
    @start_route_node = start_route_node
    @end_route_node = end_route_node
    @path = path
  end
end