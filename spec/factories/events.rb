FactoryBot.define do
  factory :event do
    image { "hoge.jpg" }

    open_time { 152000 }
    end_time { 152000 }
    name {"イベント"}
    date { 2020-03-20 }
    owner { 1 }
    place { "東京都渋谷区" }
    description { "イベントの詳細説明" }
    # date { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # image { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # open_time { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # end_time { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    
  end
end
