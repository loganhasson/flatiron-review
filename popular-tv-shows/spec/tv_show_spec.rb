require_relative './spec_helper'

describe TVShow do
  it 'should have a name' do
    buffy = TVShow.new
    buffy.name = "Buffy the Vampire Slayer"
    
    buffy.name.should eq("Buffy the Vampire Slayer")
  end

  it 'should accept an options hash as torrent' do
    bbt = TVShow.new({:name => "The Big Bang Theory S07E03 HDTV x264-LOL [eztv]"})

    bbt.name.should eq("The Big Bang Theory")
    bbt.episode.should eq('S07E03')
  end

end