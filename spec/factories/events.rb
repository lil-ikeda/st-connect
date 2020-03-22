FactoryBot.define do

  factory :event do
    name {"イベント"}
    date { 2020-03-20 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    place { "東京都渋谷区" }
    open_time { '11:20:00' }
    end_time { '11:20:00' }
    owner { 1 }
    description { "イベントの詳細説明" }

    # equence(:name) { |n| "test_user#{n}" }
  end
end
