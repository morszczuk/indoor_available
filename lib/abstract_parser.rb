require 'nokogiri'

class AbstractParser
  def initialize(xml)
    @xml = xml
  end

  def get_text_content(elem_xpath, xml = nil)
    single_elem = get_single_elem(elem_xpath, xml)
    puts "SINGLE ELEM #{single_elem}"
    puts "SINGLE ELEM content #{single_elem.content}"
    get_single_elem(elem_xpath, xml)&.content
  end

  def get_elems(elem_xpath, xml = nil)
    puts "elem xpath: #{elem_xpath}"
    root_xml = xml.nil? ? @xml : xml
    root_xml.xpath(elem_xpath)
  end

  def get_single_elem(elem_xpath, xml = nil)
    puts "elem_xpath: #{elem_xpath}"
    elems = get_elems(elem_xpath, xml)
    puts "ELEMS #{elems}"
    get_elems(elem_xpath, xml).first
  end 

  def parse_attr(attr, xml = nil)
    puts "attr: #{attr}"
    root_xml = xml.nil? ? @xml : xml
    root_xml[attr]
  end

  def parse_gml_id
    parse_attr 'gml:id'
  end
end