require_relative '../../app'

Sequel.migration do
  up do
    add_column :questions, :permalink, String
    Question.send(:get_db_schema, true)
    Question.all.each do |q|
      q.set(permalink: generate_permalink(q.question))
    end
  end

  down do
    drop_column :questions, :permalink
  end
end