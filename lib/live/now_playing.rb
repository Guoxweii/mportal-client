require File.expand_path("../now_playing_scope", __FILE__)

module Live
  class NowPlaying < OpenStruct
    
    def self.scoped
      NowPlayingScope.new(:endpoint => MportalClient.settings.base_uri + "/live/programs/now_playing.json")
    end
    
    def self.build(json)
      now_playing = NowPlaying.new
      now_playing.channel_id = json["channel"]["id"]
      now_playing.channel_name = json["channel"]["name"]
      
      now_playing.past = parse_programs(json["past"]) if json["past"]
      now_playing.now = Program.build(json["now"]) if json["now"]
      now_playing.future = parse_programs(json["future"]) if json["future"]
      
      now_playing
    end
    
    def self.parse_programs(hash)
      hash.map do |item|
        item = Program.build(item)
      end
    end
  end
end