FactoryGirl.define do
  factory :event do
    name 'The final presentation'
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'
    start_at '2012-01-10 06:45:00'
    end_at '2012-01-10 08:45:00'
    circle
    user
  end
  factory :circle do
    name "This is my circle" 
  end
  factory :user do
    email 'google@google.com'
    password '123456'
    password_confirmation '123456'
  end
end


