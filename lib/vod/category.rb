require File.expand_path("../category_scope", __FILE__)
require File.expand_path("../tag", __FILE__)
# require File.expand_path("../program", __FILE__)

module Vod
  class Category < OpenStruct
    
    def programs
      Vod::Program.scoped(:endpoint => MportalClient.settings.vod_uri + self.programs_endpoint)
    end
    
    def tag(id)
      self.tags.detect {|t| t.id.to_s == id.to_s }
    end
    
    def self.scoped
      CategoryScope.new(:endpoint => MportalClient.settings.vod_uri + "/v2/vod/categories.json")
    end
    
    def self.build(attrs)
      json = attrs.extract!("updated_at", "tags")
      category = Category.new(attrs)
      category.updated_at = Time.parse(json["updated_at"])
      category.tags = json["tags"].map {|t| Tag.build(category, t) }
      category
    end
    
  end
end