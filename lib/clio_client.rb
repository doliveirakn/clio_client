require 'net/http'
require 'json'

module ClioClient
  autoload :Record, 'clio_client/record'

  autoload :Activity,            'clio_client/activity'
  autoload :TimeEntry,           'clio_client/time_entry'
  autoload :ExpenseEntry,        'clio_client/expense_entry'
  autoload :User,                'clio_client/user'
  autoload :ActivityDescription, 'clio_client/activity_description'
  autoload :Communication,        'clio_client/communication'
  autoload :Matter,              'clio_client/matter'

  module Api
    autoload :Activity,          'clio_client/api/activity'
    autoload :Crud,              'clio_client/api/crud'
    autoload :TimeEntry,         'clio_client/api/time_entry'
    autoload :ExpenseEntry,      'clio_client/api/expense_entry'
    autoload :Base,              'clio_client/api/base'

  end

end
