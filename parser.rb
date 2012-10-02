# -*- coding: utf-8 -*- 
class HtmlParser
  require 'nokogiri'
  require 'open-uri'
  require 'json'

  DEFAULT_URL = "http://www.au.kddi.com/developer/android/kishu/device/index.html"

  def initialize
    @url = DEFAULT_URL
  end

  def output
    p data = parse
    p convert_array_to_json(data)
  end

  def convert_array_to_json(data)
    JSON.pretty_generate(data)
  end

  def parse
    doc = Nokogiri::HTML(open(@url))

    table = doc.css("table")
    array = []
    table.css("tr").each do |tr|
      elem = tr.content.split("\r\n")
      model = elem.slice!(0)
      array << { model => elem }
    end
    array
  end
end

parser = HtmlParser.new
parser.output
