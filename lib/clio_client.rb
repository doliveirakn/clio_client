Dir[File.dirname(__FILE__) + "/clio_client/api/*.rb"].each {|file| require file }
require 'net/http'
require 'json'

module ClioClient
  autoload :Record, 'clio_client/record'

  autoload :Activity,            'clio_client/activity'
  autoload :User,                'clio_client/user'
  autoload :ActivityDescription, 'clio_client/activity_description'
  autoload :Communication,        'clio_client/communication'
  autoload :Matter,              'clio_client/matter'

  module Api
    autoload :Activity,          'clio_client/api/activity'
    autoload :Base,              'clio_client/api/base'

  end

end
