module Live
  class ChannelScope < MportalClient::BaseScope
    def categories(values)
      self.query["categories"] = [ values ].flatten.join(",")
      self
    end
    
    def name_like(name)
      fetch_callbacks << Proc.new { |channel| channel if channel.name.include?(name) }
      self
    end
    
    def all
      hash = self.fetch
      channels = hash["channels"].map {|c| Channel.build(c) }
      apply_fetch_callbacks!(channels)
    end
  end
end