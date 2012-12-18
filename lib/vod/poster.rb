module Vod
  class Poster < OpenStruct
    
    def self.build(attrs)
      Poster.new(attrs)
    end
    
  end
end