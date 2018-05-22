require_relative 'abstract_parser.rb'
require_relative 'route_segment_parser.rb'
require_relative 'route_member.rb'

class RouteMemberParser < AbstractParser
  def parse
    RouteMember.new parse_route_segments
  end

  private

  def parse_route_segments
    get_elems('.//nav:RouteSegment').map do |route_segment_xml|
      RouteSegmentParser.new(route_segment_xml).parse
    end
  end
end