require 'net/http'
require 'json'

module ClioClient
  autoload :Session,             'clio_client/session'
  autoload :Record,              'clio_client/record'
  autoload :Http,                'clio_client/http'
  autoload :Authorization,       'clio_client/authorization'

  # Models
  autoload :Activity,            'clio_client/models/activity'
  autoload :ActivityDescription, 'clio_client/models/activity_description'
  autoload :Communication,       'clio_client/models/communication'
  autoload :ExpenseEntry,        'clio_client/models/expense_entry'
  autoload :Matter,              'clio_client/models/matter'
  autoload :TimeEntry,           'clio_client/models/time_entry'
  autoload :User,                'clio_client/models/user'

  module Api
    autoload :Base,              'clio_client/api/base'

    autoload :Activity,          'clio_client/api/activity'

    autoload :Crudable,          'clio_client/api/crudable'
    autoload :Findable,          'clio_client/api/findable'
    autoload :Listable,          'clio_client/api/listable'


  end

end
