require_relative '../lib/route_parser.rb'
require_relative '../lib/route.rb'
require_relative '../lib/line_string.rb'
require_relative '../lib/route_node.rb'

describe RouteParser do
  before(:all) do
    test_xml_1_path = 'test_data/routes_set_1.xml'
    route_xml = Nokogiri::XML(File.read(test_xml_1_path))
    @parsed_route = RouteParser.new(route_xml.xpath('.//nav:Route').first).parse
  end

  context 'Parsed Route' do
    it 'has correct gml_id attr' do
      expect(@parsed_route.gml_id).to eql('Route1')
    end

    it 'has correct startRouteNode attr' do
      expect(@parsed_route.start_route_node).to be_instance_of(RouteNode)
      expect(@parsed_route.start_route_node.gml_id).to eq('RouteNode1')
      expect(@parsed_route.start_route_node.point.lat).to eq(52.222050)
    end

    it 'has correct endRouteNode attr' do
      expect(@parsed_route.end_route_node).to be_instance_of(RouteNode)
      expect(@parsed_route.end_route_node.gml_id).to eq('RouteNode2')
      expect(@parsed_route.end_route_node.point.lat).to eq(52.222105)
    end

    it 'has correct route_nodes attr' do
      expect(@parsed_route.route_nodes.count).to eql(2)
      expect(@parsed_route.route_nodes[0]).to be_instance_of(RouteNode)
      expect(@parsed_route.route_nodes[0]).to eql(@parsed_route.start_route_node)
    end

    context 'path attribute' do
      before(:all) do
        @path = @parsed_route.path
      end

      it 'has correct gml_id' do
        expect(@path.gml_id).to eql('path')
      end

      it 'has correct connects inside route segment' do
        expect(@path.route_members[0].route_segments[0].connected_nodes.count).to eql(2)
        expect(@path.route_members[0].route_segments[0].connected_nodes[0]).to be_instance_of(RouteNode)
      end
    end
  end
end