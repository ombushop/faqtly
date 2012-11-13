Sequel.migration do
  up do
    add_column :tags, :permalink, String
    Tag.send(:get_db_schema, true)
    Tag.all.each do |t|
      q.set(permalink: generate_permalink(t.name))
    end
  end

  down do
    drop_column :tags, :permalink
  end
end
