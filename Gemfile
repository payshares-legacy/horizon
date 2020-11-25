source 'https://rubygems.org'

gem 'rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'aasm', '~> 4.0.8'
gem 'metriks', '~> 0.9.9.7'
# gem 'xdr'
# gem 'xdr', path: "../ruby-xdr", require: false
gem 'xdr', git: 'https://github.com/payshares/ruby-xdr.git'
# gem 'payshares-base', require: false
# gem 'payshares-base', path: "../ruby-payshares-base", require: false
gem 'payshares-base', git: 'https://github.com/payshares/ruby-payshares-base.git'
gem 'faraday', '0.9.1'
gem 'faraday_middleware', '0.9.1'
gem 'composite_primary_keys', '~> 7.0.13'
gem 'memoist'
gem 'backports'
gem 'json_expressions'
gem 'rack-attack'
gem 'oat'
gem 'low_card_tables'
gem 'rack-cors', :require => 'rack/cors'
gem 'rails_stdout_logging', group: :production
gem 'awesome_print'
gem 'sentry-raven'

# note: the following celluloid and sucker_punch gems are require: false
# so that the rspec system can bootup the system manually.
# See config/initializers/celluloid.rb for where we include these files in
# non-test scenarios
gem 'celluloid', require: false
gem 'sucker_punch', require: false

# sql gems
gem 'pg', '0.18.1'
gem 'sqlite3'

#memcached
gem 'memcached', require: 'memcached'

#webservers
gem 'puma'


gem 'dotenv-rails', github: "bkeepers/dotenv"

group :test, :development do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'shoulda-matchers'
  gem 'guard'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'vcr', require: false
  gem 'webmock', require: false
  gem 'yard'
  gem 'apiaryio'
  gem 'timecop'
  # gem 'payshares_core_commander', ">= 0.0.2", require: false
  gem 'payshares_core_commander', git: 'https://github.com/payshares/payshares_core_commander.git'
end
