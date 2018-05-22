class LineString
  attr_accessor :gml_id, :positions

  def initialize(gml_id, positions)
    @gml_id    = gml_id
    @positions = positions
  end
end