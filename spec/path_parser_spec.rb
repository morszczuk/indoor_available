require_relative '../lib/path_parser.rb'
require_relative '../lib/path.rb'
require_relative '../lib/line_string.rb'
require_relative '../lib/route_node.rb'

describe PathParser do
  before(:all) do
    raw_path_xml = '<nav:path gml:id="path" xmlns:nav="http://www.opengis.net/indoorgml/1.0/navigation" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gml="http://www.opengis.net/gml/3.2"><nav:routeMember><nav:RouteSegment gml:id="RouteSegment"><nav:weight>1.0</nav:weight><nav:connects xlink:href="#RouteNode1"/><nav:connects xlink:href="#RouteNode2" /><nav:referencedTransition></nav:referencedTransition><nav:geometry><gml:LineString gml:id="LineString"><gml:pos>52.222050 21.007003</gml:pos><gml:pos>52.222105 21.007003</gml:pos></gml:LineString></nav:geometry></nav:RouteSegment></nav:routeMember></nav:path>'
    path_xml = Nokogiri::XML(raw_path_xml)
    @parsed_path = PathParser.new(path_xml.xpath('.//nav:path').first).parse
  end

  context 'parsed Path' do
    it 'has correct gml_id attr' do
      expect(@parsed_path.gml_id).to eql('path')
    end

    it 'has correct route_members attr' do
      expect(@parsed_path.route_members.count).to eql(1)
      expect(@parsed_path.route_members[0]).to be_instance_of(RouteMember)
      expect(@parsed_path.route_members[0].route_segments.count).to eql(1)
      route_segment = @parsed_path.route_members[0].route_segments[0]
      expect(route_segment).to be_instance_of(RouteSegment)
      expect(route_segment.gml_id).to eql('RouteSegment')
    end
  end
end