require 'nokogiri'
require 'faraday'
require 'pry'

class PirateBay
  attr_accessor :url
  attr_writer :torrents

  TOP100Shows = 'http://thepiratebay.sx/top/205'
  
  def initialize(url = TOP100Shows)
    @url = url
  end

  def scrape
  end

  def html
    @html ||= Faraday.get(self.url).body
    # raise self.html.inspect
  end

  def doc
    @doc ||= Nokogiri::HTML(self.html)
  end

  def torrents
    @torrents ||= self.doc.css("a.detLink").collect do |torrent_doc|
      {
        :name => torrent_doc.content, 
        :href => "http://thepiratebay.sx/#{torrent_doc.attr('href')}"
      }
    end
  end

  def shows
    self.torrents.collect do |torrent|
      TVShow.new(torrent)
    end
  end

end