# encoding: utf-8
require File.expand_path("../program_scope", __FILE__)
require File.expand_path("../episode", __FILE__)
require File.expand_path("../poster", __FILE__)

module Vod
  class Program < OpenStruct
    
    def poster_relative_path(options = {})
      poster = self.posters.detect {|p| p.style.to_s == options[:style].to_s }
      poster ||= self.posters.first
      poster.try(:relative_path)
    end
    
    def self.scoped(options)
      ProgramScope.new(options)
    end
    
    def self.build(attrs)
      json = attrs.extract!("updated_at", "posters", "episodes")
      program = Program.new(attrs)
      
      program.updated_at = Time.parse(json["updated_at"])
      
      program.posters = []
      program.posters = json["posters"].map { |poster| Poster.build(poster) } if json["posters"]
      
      program.episodes = []
      program.episodes = json["episodes"].map { |episode| Episode.build(episode) }
      
      program
    end
    
  end
end
