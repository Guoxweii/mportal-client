module Vod
  class Episode < OpenStruct
    
    def self.build(attrs)
      episode = Episode.new(attrs)
      episode
    end
    
  end
end