require_relative 'abstract_parser.rb'
require_relative 'geometry_parser.rb'

require_relative 'route_segment.rb'
class RouteSegmentParser < AbstractParser
  def parse
    RouteSegment.new parse_gml_id,
                     get_text_content('.//nav:weight'),
                     parse_connected_nodes,
                     parse_referenced_transition,
                     parse_geometry
  end

  private

  def parse_connected_nodes
    get_elems('.//nav:connects').map do |connected_node|
      parse_connected_elem connected_node
    end
  end

  def parse_connected_elem(connected_node)
    xlink = parse_attr('xlink:href', connected_node)
    return /\#(.*)/.match(xlink)[1] unless xlink.nil?
    RouteNodeParser(connected_node.xpath('.//nav:RouteNode'))
  end

  def parse_referenced_transition
    #TO DO
    return nil
  end

  def parse_geometry
    GeometryParser.new(get_single_elem('.//nav:geometry'))
                  .parse
  end
end
