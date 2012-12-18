module Live
  class ProgramScope < MportalClient::BaseScope
    
    def all
      hash = self.fetch
      programs = hash["programs"].map {|p| Program.build(p) }
      apply_fetch_callbacks!(programs)
    end
    
    def paginate(options = {})
      page = options[:page].to_i
      page = 1 if (page < 1) 
      
      per_page = options[:per_page] || 20
      offset =  (page - 1) * per_page
      self.offset(offset)
      self.limit(per_page)
      
      json = self.fetch
      programs = json["programs"].map {|p| Program.build(p) }
      Kaminari.paginate_array(programs, :offset => offset, :limit => per_page, :total_count => json["total_count"])
    end
    
    def find(id)
      self.query["id"] = id
      self.first
    end
    
    def offset(val)
      self.query[:offset] = val
      self
    end
    
    def limit(val)
      self.query[:limit] = val
      self
    end
    
  end
end