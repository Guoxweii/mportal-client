module Live
  class NowPlayingScope < MportalClient::BaseScope
    
    def all
      hash = self.fetch
      now_playings = hash["playing_list"]
      now_playings = now_playings.map { |n| NowPlaying.build(n) }
    end
    
  end
end
