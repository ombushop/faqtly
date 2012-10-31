Sequel.migration do
  change do
    create_table(:questions_tags) do
      primary_key :id
      foreign_key :question_id, :questions
      foreign_key :tag_id, :tags
    end
  end
end
