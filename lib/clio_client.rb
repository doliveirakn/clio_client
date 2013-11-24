Dir[File.dirname(__FILE__) + "/clio_client/api/*.rb"].each {|file| require file }
require "clio_client/version"
require 'net/http'
require 'json'

module ClioClient
end
