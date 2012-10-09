Sequel.migration do
  change do
    add_column :questions, :permalink, String
    Question.send(:get_db_schema, true)
    Question.all.each do |q|
      q.set(permalink: Rack::Utils.escape(q.question))
    end
  end
end