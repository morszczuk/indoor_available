require_relative 'route_member_parser.rb'
require_relative 'path.rb'

class PathParser < AbstractParser
  def parse
    Path.new parse_gml_id, parse_route_members
  end

  private

  def parse_route_members
    get_elems('.//nav:routeMember').map do |route_member_xml|
      RouteMemberParser.new(route_member_xml).parse
    end
  end
end