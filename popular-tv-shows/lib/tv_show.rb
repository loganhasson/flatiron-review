class TVShow
  attr_accessor :name

  EPISODE_REGEX = /S\d{2}E\d{2}/

  def initialize(torrent = {})
    @torrent = torrent
  end

  def name
    @name ||= @torrent[:name].split(EPISODE_REGEX).first.strip
  end

  def episode
    @episode ||= @torrent[:name].scan(EPISODE_REGEX).to_s.strip
  end

  def href
    @href = @torrent[:href]
  end
end