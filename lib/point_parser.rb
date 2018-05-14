require_relative 'abstract_parser.rb'
require_relative 'point.rb'

class PointParser
  def initialize(point_xml)
    @point_xml = point_xml
  end

  def parse
    gml_id = @point_xml.first.attr('gml:id')
    lat, lon, alt = get_position_coordinates
    Point.new gml_id, lat, lon, alt
  end

  private

  def get_position_coordinates
    content = @point_xml.xpath('.//gml:pos').first.content
    content.split(' ')
  end
end
