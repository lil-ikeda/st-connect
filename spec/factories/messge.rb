FactoryBot.define do

  factory :message do
    content {"message!!"}
    room_id { 1 }
    user_id { 1 }
    association :room
    association :user
    # user { room.user }
    # date { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # image { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # open_time { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # end_time { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }  
  end
end
