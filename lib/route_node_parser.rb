require_relative 'point_parser.rb'
require_relative 'route_node.rb'

class RouteNodeParser
  def initialize(route_node_xml)
    @route_node_xml = route_node_xml
  end

  def parse
    RouteNode.new route_node_gml_id, route_node_point
  end

  private

  def route_node_gml_id
    @route_node_xml['gml:id']
  end

  def route_node_point
    point_xml = @route_node_xml.xpath('.//nav:geometry/gml:Point')
    PointParser.new(point_xml).parse
  end
end
