require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

#turns off debug logging in terminal, only necessary when running CLI.
ActiveRecord::Base.logger.level = :info

ActiveSupport::Deprecation.silenced = true
