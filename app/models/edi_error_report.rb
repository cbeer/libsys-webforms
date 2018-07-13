# Model for the Edi Error Report table
class EdiErrorReport < ActiveRecord::Base
  # so we can use the database table column name 'type' which is normally a reserved keyword
  # which rails uses to define the subclass of a model that should be loaded.
  self.inheritance_column = 'inheritance_type'

  scope :day, ->(day) { where(date_query, day.to_date) }

  self.table_name = 'edi_error_report'

  # The date queries for 'development' sqlite3 and 'production' Oracle SQL are different
  # In order to test the application locally we need to check the database configuration
  # against the environment to construct the correct query.
  # (N.B. There may be a less hacky way to do this using the oracle_enhanced adapter or ruby-oci8...)
  def self.date_query
    if Rails.configuration.database_configuration[Rails.env]['database'] =~ /sqlite3/
      'DATE(run) = ?'
    else
      'trunc(run) = ?'
    end
  end
end