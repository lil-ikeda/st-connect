FactoryBot.define do

  factory :comment do
    text { "コメント" }
    user_id { 1 }
    event_id { 2 }
    association :event
    association :user
  end

end
