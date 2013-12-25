# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    title "MyString"
    question "MyText"
    answer "MyText"
    group_id 1
    updated_by 1
  end
end
