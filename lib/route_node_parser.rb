require_relative 'point_parser.rb'
require_relative 'route_node.rb'

class RouteNodeParser < AbstractParser
  def parse
    RouteNode.new parse_gml_id, route_node_point
  end

  private

  def route_node_point
    point_xml = @xml.xpath('.//nav:geometry/gml:Point').first
    PointParser.new(point_xml).parse
  end
end
