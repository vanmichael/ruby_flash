# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name 'van'
  	last_name 'nguyen'
  	email 'van@gmail.com'
  	password 'password'
    password_confirmation 'password'
  end
end
