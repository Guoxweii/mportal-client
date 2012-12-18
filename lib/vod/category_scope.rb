module Vod
  class CategoryScope < MportalClient::BaseScope

    def all
      hash = self.fetch
      categories = hash["roots"].map {|c| Category.build(c) }
      apply_fetch_callbacks!(categories)
    end
    
  end
end