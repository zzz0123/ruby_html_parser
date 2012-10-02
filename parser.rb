# -*- coding: utf-8 -*- 
class HtmlParser
  require 'nokogiri'
  require 'open-uri'

  DEFAULT_URL = "http://www.au.kddi.com/developer/android/kishu/device/index.html"

  def initialize
    @url = DEFAULT_URL
  end

  def parse
    doc = Nokogiri::HTML(open(@url))

    table = doc.css("table")
    table.css("tr").each do |elem|
      p elem.content
    end
  end
end

parser = HtmlParser.new
parser.parse
