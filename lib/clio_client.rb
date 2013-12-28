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

  autoload :PhoneNumber,         'clio_client/support/phone_number'
  autoload :EmailAddress,        'clio_client/support/email_address'
  autoload :Address,             'clio_client/support/address'
  autoload :WebSite,             'clio_client/support/web_site'
  autoload :InstantMessenger,    'clio_client/support/instant_messenger'
  autoload :CustomFieldValue,    'clio_client/support/custom_field_value'
  autoload :CustomFieldCheckboxValue, 'clio_client/support/custom_field_checkbox_value'
  autoload :CustomFieldContactValue,  'clio_client/support/custom_field_contact_value'
  autoload :CustomFieldCurrencyValue, 'clio_client/support/custom_field_currency_value'
  autoload :CustomFieldDateValue,     'clio_client/support/custom_field_date_value'
  autoload :CustomFieldTimeValue,     'clio_client/support/custom_field_time_value'
  autoload :CustomFieldEmailValue,    'clio_client/support/custom_field_email_value'
  autoload :CustomFieldMatterValue,   'clio_client/support/custom_field_matter_value'
  autoload :CustomFieldNumericValue,  'clio_client/support/custom_field_numeric_value'
  autoload :CustomFieldPicklistValue, 'clio_client/support/custom_field_picklist_value'
  autoload :CustomFieldPicklistOption,'clio_client/support/custom_field_picklist_option'
  autoload :CustomFieldTextAreaValue, 'clio_client/support/custom_field_text_area_value'
  autoload :CustomFieldTextLineValue, 'clio_client/support/custom_field_text_line_value'
  autoload :CustomFieldUrlValue,      'clio_client/support/custom_field_url_value'
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
    autoload :Contact,            'clio_client/api/contact'

    autoload :Crudable,          'clio_client/api/crudable'
    autoload :Findable,          'clio_client/api/findable'
    autoload :Listable,          'clio_client/api/listable'


  end

end
