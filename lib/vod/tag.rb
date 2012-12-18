require File.expand_path("../program", __FILE__)

module Vod
  class Tag < OpenStruct
    
    def programs
      Vod::Program.scoped(:endpoint => self.programs_endpoint)
    end
    
    def self.build(category, attrs)
      json = attrs.extract!("updated_at")
      tag = Tag.new(attrs)
      tag.category = category
      tag.updated_at = Time.parse(json["updated_at"])
      tag
    end
    
  end
end


