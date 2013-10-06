require_relative './spec_helper'

describe PirateBay do  
  it "should have a url" do
    tv_show = PirateBay.new

    tv_show.url = "http://thepiratebay.se"
    tv_show.url.should eq("http://thepiratebay.se")
  end

  it 'should default to the top 100 tv shows as the url' do
    tv_show = PirateBay.new

    tv_show.url.should eq(PirateBay::TOP100Shows)
  end

  context 'scraping torrents' do
    it 'should respond to a scrape method' do
      tv_show = PirateBay.new

      tv_show.should respond_to(:scrape)
      # tv_show.respond_to?(:scrape).should eq(true)
    end

    it 'should open the url and read HTML' do
      tv_show = PirateBay.new      

      tv_show.html.should include("html")
    end
    
    it 'should have a nokogiri doc' do
      tv_show = PirateBay.new

      tv_show.doc.should be_a(Nokogiri::HTML::Document)
    end

    it 'should load a list of torrents' do
      tv_show = PirateBay.new

      tv_show.torrents.should be_a(Array)
    end

    it 'should parse those torrents for tv show names' do
      tv_show = PirateBay.new

      # Given there was a torrent with exactly this
      # which I can't garuntee if The Big Bang isn't
      # the most popular show.

      tv_show.torrents = [{
        :name => "The Big Bang Theory S07E03 HDTV x264-LOL [eztv]"
      }]

      tv_show.shows.first.name.should eq("The Big Bang Theory")
    end
  end
end