FactoryBot.define do

  factory :comment do
    id { 1 }
    text { "コメント" }
    user_id { 1 }
    event_id { 2 }
    association :event
    association :user
  end

end
