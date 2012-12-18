require File.expand_path("../program_scope", __FILE__)
require File.expand_path("../now_playing", __FILE__)

module Live
  class Program < OpenStruct
    class << self
      def scope(options = {})
        Live::ProgramScope.new(options)
      end
      
      def build(attrs)
        json = attrs.extract!("broadcast_start_at", "broadcast_end_at", "updated_at")
        program = Program.new(attrs)
        
        program.broadcast_start_at = Time.parse(json["broadcast_start_at"])
        program.broadcast_end_at = Time.parse(json["broadcast_end_at"])
        program.updated_at = Time.parse(json["updated_at"])
        program
      end
      
      def now_playing
        Live::NowPlaying.scoped.all
      end
      
    end
  end
end