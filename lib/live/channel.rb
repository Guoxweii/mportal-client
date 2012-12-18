require File.expand_path("../channel_scope", __FILE__)
require File.expand_path("../program", __FILE__)
module Live
  class Channel < OpenStruct
    class << self
      attr_accessor :categories

      def scoped
        scope = ChannelScope.new(:endpoint =>  MportalClient.settings.base_uri + "/live/channels.json")
        scope.categories(self.categories) if self.categories
        scope
      end
      
      def build(attrs)
        json = attrs.extract!("updated_at", "shifting", "code")
        channel = Channel.new(attrs)
        channel.sitv_code = json["code"] if json["code"]
        channel.updated_at = Time.parse(json["updated_at"]) if json["updated_at"]
        channel.shifting = Shifting.build(json["shifting"]) if json["shifting"]
        channel
      end
    end
    
    def programs
      Live::Program.scoped(:endpoint => MportalClient.settings.base_uri + self.programs_endpoint)
    end
  end
end