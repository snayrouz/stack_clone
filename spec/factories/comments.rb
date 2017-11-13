FactoryBot.define do
  factory :comment do
    text "MyString"
    user nil
    commentable_id 1
    commentable_type "MyString"
  end
end
