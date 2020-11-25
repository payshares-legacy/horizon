source 'https://rubygems.org'

gem 'rails', '4.1.9'
gem 'jbuilder', '2.2.8'
gem 'sdoc', '0.4.1', group: :doc
gem 'aasm', '4.0.8'
gem 'metriks', '0.9.9.7'
# gem 'xdr'
gem 'xdr', path: '../ruby-xdr', require: false
# gem 'xdr', git: 'https://github.com/payshares/ruby-xdr.git'
# gem 'payshares-base', require: false
gem 'payshares-base', path: '../ruby-payshares-base', require: false
# gem 'payshares-base', git: 'https://github.com/payshares/ruby-payshares-base.git'
gem 'faraday', '0.9.1'
gem 'faraday_middleware', '0.9.1'
gem 'composite_primary_keys', '7.0.13'
gem 'memoist', '0.11.0'
gem 'backports', '3.6.4'
gem 'json_expressions', '0.8.3'
gem 'rack-attack', '4.2.0'
gem 'oat', '0.4.6'
gem 'low_card_tables', '1.1.0'
# rack-cors version 0.3.1
gem 'rack-cors', :require => 'rack/cors'
# rails_stdout_logging version 0.0.3
gem 'rails_stdout_logging', group: :production
gem 'awesome_print', '1.6.1'
gem 'sentry-raven', '0.13.1'

# note: the following celluloid and sucker_punch gems are require: false
# so that the rspec system can bootup the system manually.
# See config/initializers/celluloid.rb for where we include these files in
# non-test scenarios
# celluloid version 0.16.0
gem 'celluloid', require: false
# sucker_punch version 1.4.0
gem 'sucker_punch', require: false

# sql gems
gem 'pg', '0.18.1'
gem 'sqlite3', '1.3.10'

# memcached version 1.8.0
gem 'memcached', require: 'memcached'

# webservers
gem 'puma', '2.11.1'

# dotenv-rails version 1.0.2
gem 'dotenv-rails', github: 'bkeepers/dotenv'

group :test, :development do
  gem 'rspec-rails', '3.2.1'
  gem 'pry-rails', '0.3.3'
  gem 'shoulda-matchers', '2.8.0'
  gem 'guard', '2.12.4'
  gem 'guard-rspec', '4.5.0'
  gem 'factory_girl_rails', '4.5.0'
  gem 'database_cleaner', '1.4.0'
  # simplecov version 0.9.2
  gem 'simplecov', require: false
  # vcr version 2.9.3
  gem 'vcr', require: false
  # webmock version 1.20.4
  gem 'webmock', require: false
  gem 'yard', '0.8.7.6'
  gem 'apiaryio', '0.2.0'
  gem 'timecop', '0.7.3'
  # gem 'payshares_core_commander', '>= 0.0.2', require: false
  # gem 'payshares_core_commander', git: 'https://github.com/payshares/payshares_core_commander.git'
  gem 'payshares_core_commander', path: '../payshares_core_commander', require: false
end
