class RouteSegment
  attr_accessor :gml_id, 
                :weight,
                :connected_nodes,
                :referenced_transition,
                :geometry

  def initialize(gml_id, weight, connected_nodes, referenced_transition, geometry)
    @gml_id                = gml_id
    @weight                = weight.to_f
    @connected_nodes       = connected_nodes       || []
    @referenced_transition = referenced_transition
    @geometry              = geometry
  end
end