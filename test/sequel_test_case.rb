class SequelTestCase < Test::Unit::TestCase
  def run(*args, &block)
    result = nil
    ::Sequel.extension :migration
    ::Sequel::Migrator.run Sequel::Model.db, "db/migrate", :target => 0
    ::Sequel::Migrator.run Sequel::Model.db, "db/migrate"    
    Sequel::Model.db.transaction(:rollback=>:always){result = super}
    result
  end
end