require "httparty"
require 'ostruct'
require "active_support/all"
require "kaminari"
require 'kaminari/models/array_extension'

module MportalClient
  include HTTParty
  
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp
  class << self
    attr_accessor :settings
  end
  
  self.settings = OpenStruct.new(
    :base_uri => "http://epgdata.cloudtv.ocn.net.cn/api/v2",
    :vod_uri => "http://58.196.13.10:7100/mam/api",
    :cache => nil
  )
  
  autoload :HttpClient,   "client/http_client"
  autoload :BaseScope,    "client/base_scope"
end

require File.expand_path("../live/channel", __FILE__)
require File.expand_path("../vod/category", __FILE__)