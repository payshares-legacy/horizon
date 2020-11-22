RSpec.configure do |c|
  c.before(:suite) do
    if RECORD
      Recorder::TransactionSeeder.new.run
    end

    pg_dump = PgDump.new(Hayashi::Base, "#{SPEC_ROOT}/fixtures/payshares-core.sql")
    pg_dump.load
  end
end