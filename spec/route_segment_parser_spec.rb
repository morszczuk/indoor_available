require_relative '../lib/route_segment_parser.rb'
require_relative '../lib/route_segment.rb'
require_relative '../lib/line_string.rb'
require_relative '../lib/route_node.rb'

describe RouteSegmentParser do
  before(:all) do
    raw_route_segment_xml = '<nav:RouteSegment gml:id="RouteSegment" xmlns:nav="http://www.opengis.net/indoorgml/1.0/navigation" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gml="http://www.opengis.net/gml/3.2"><nav:weight>1.0</nav:weight><nav:connects xlink:href="#RouteNode1"/><nav:connects xlink:href="#RouteNode2" /><nav:referencedTransition></nav:referencedTransition><nav:geometry><gml:LineString gml:id="LineString"><gml:pos>52.222050 21.007003</gml:pos><gml:pos>52.222105 21.007003</gml:pos></gml:LineString></nav:geometry></nav:RouteSegment>'
    route_segment_xml = Nokogiri::XML(raw_route_segment_xml)
    @parsed_route_segment = RouteSegmentParser.new(route_segment_xml.xpath('.//nav:RouteSegment').first).parse
  end

  context 'parsed RouteSegment' do
    it 'has correct gml_id attr' do
      expect(@parsed_route_segment.gml_id).to eql('RouteSegment')
    end

    it 'has correct weight attr' do
      expect(@parsed_route_segment.weight).to eql(1.0)
    end

    it 'has correct connects attr' do
      expect(@parsed_route_segment.connected_nodes.count).to eql(2)
      expect(@parsed_route_segment.connected_nodes[0]).to eql('RouteNode1')
      expect(@parsed_route_segment.connected_nodes[1]).to eql('RouteNode2')
    end

    it 'has correct geometry attr' do
      expect(@parsed_route_segment.geometry).to be_instance_of(LineString)
      expect(@parsed_route_segment.geometry.gml_id).to eql('LineString')
      expect(@parsed_route_segment.geometry.positions[0][:lon]).to eql(21.007003)
    end
  end
end