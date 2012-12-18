module MportalClient
  class HttpClient
    include HTTParty

    def self.default_options
      { 
        :base_uri => MportalClient.settings.base_uri,
      }.merge(@default_options)
    end
    
  end
end