require 'net/http'
require 'json'

module ClioClient
  autoload :Session,             'clio_client/session'
  autoload :Base,                'clio_client/base'
  autoload :Resource,            'clio_client/resource'
  autoload :Http,                'clio_client/http'
  autoload :Authorization,       'clio_client/authorization'

  # Models
  autoload :Activity,            'clio_client/models/activity'
  autoload :ActivityDescription, 'clio_client/models/activity_description'
  autoload :Bill,                'clio_client/models/bill'
  autoload :CalendarEntry,       'clio_client/models/calendar_entry'
  autoload :Calendar,            'clio_client/models/calendar'
  autoload :Communication,       'clio_client/models/communication'
  autoload :Company,             'clio_client/models/company'
  autoload :Contact,             'clio_client/models/contact'
  autoload :ExpenseEntry,        'clio_client/models/expense_entry'
  autoload :EmailCommunication,  'clio_client/models/email_communication'
  autoload :Matter,              'clio_client/models/matter'
  autoload :Person,              'clio_client/models/person'
  autoload :PhoneCommunication,  'clio_client/models/phone_communication'
  autoload :TimeEntry,           'clio_client/models/time_entry'
  autoload :User,                'clio_client/models/user'

  # Support classes
  autoload :Rate,                'clio_client/support/rate'
  autoload :Reminder,            'clio_client/support/reminder'


  module Api
    autoload :Base,              'clio_client/api/base'

    autoload :Activity,           'clio_client/api/activity'
    autoload :ActivityDescription,'clio_client/api/activity_description'
    autoload :Bill,               'clio_client/api/bill'
    autoload :CalendarEntry,      'clio_client/api/calendar_entry'
    autoload :Calendar,           'clio_client/api/calendar'
    autoload :Communication,      'clio_client/api/communication'

    autoload :Crudable,          'clio_client/api/crudable'
    autoload :Findable,          'clio_client/api/findable'
    autoload :Listable,          'clio_client/api/listable'


  end

end
