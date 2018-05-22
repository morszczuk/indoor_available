require_relative '../lib/line_string_parser.rb'
require_relative '../lib/line_string.rb'

describe LineStringParser do
  before(:all) do
    raw_line_string_xml = '<gml:LineString gml:id="LineString" xmlns:nav="http://www.opengis.net/indoorgml/1.0/navigation" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gml="http://www.opengis.net/gml/3.2"><gml:pos>52.222050 21.007003</gml:pos><gml:pos>52.222105 21.007003</gml:pos></gml:LineString>'
    line_string_xml = Nokogiri::XML(raw_line_string_xml)
    @parsed_line_string = LineStringParser.new(line_string_xml.xpath('.//gml:LineString').first).parse
  end

  context 'parsed LineString' do
    it 'has correct gml_id attr' do
      expect(@parsed_line_string.gml_id).to eql('LineString')
    end

    it 'has correct positions attr' do
      expect(@parsed_line_string.positions).to be_instance_of(Array)
      expect(@parsed_line_string.positions.count).to eql(2)
      expect(@parsed_line_string.positions[0]).to be_instance_of(Hash)
      expect(@parsed_line_string.positions[0][:lat]).to eql(52.222050)
      expect(@parsed_line_string.positions[0][:lon]).to eql(21.007003)
      expect(@parsed_line_string.positions[1][:lat]).to eql(52.222105)
      expect(@parsed_line_string.positions[1][:lon]).to eql(21.007003)
      expect(@parsed_line_string.positions[0][:alt]).to eql(0.0)
      expect(@parsed_line_string.positions[1][:alt]).to eql(0.0)
    end
  end
end