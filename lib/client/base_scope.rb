module MportalClient
  class BaseScope
    attr_accessor :fetch_callbacks
    attr_accessor :endpoint, :query
    
    def initialize(options = {})
      self.fetch_callbacks = []
      self.endpoint = options[:endpoint]
      self.query = options[:query] || {}
    end
    
    def apply_fetch_callbacks?(item)
      self.fetch_callbacks.each do |callback|
        return false if !(callback.call(item))
      end
      
      return true
    end
    
    def apply_fetch_callbacks!(items)
      items.find_all do |item|
        self.apply_fetch_callbacks?(item)
      end
    end
    
    def first
      self.all.first
    end
    
    def find(id)
      self.all.each do |item|
        return item if item.id.to_s == id.to_s
      end
      return nil
    end
    
    def fetch
      MportalClient::HttpClient.get(self.endpoint, :query => self.query).parsed_response
    end
    
  end
end