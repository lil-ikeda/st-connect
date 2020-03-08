require 'rails_helper'

describe Event do
  describe '#create' do
    
    # 1.name, date, image, place, open_time, end_time, owner, descriptionが存在すれば登録できること
    it "is valid with a name, date, image, place, open_time, end_time, owner, description" do
      event = build(:event)
      event.valid?
      expect(event).to be_valid
    end

    # 2.nameが空では登録ができないこと
    it "is invalid without a name" do
      event = build(:event, name: "")
      event.valid?
      expect(event.errors[:name]).to include("を入力してください")
    end
    
    # 3.dateが空では登録ができないこと
    it "is invalid without a date" do
      event = build(:event, date: "")
      event.valid?
      expect(event.errors[:date]).to include("を入力してください")
    end
    
    # 4.placeが空では登録ができないこと
    it "is invalid without a place" do
      event = build(:event, place: "")
      event.valid?
      expect(event.errors[:place]).to include("を入力してください")
    end
    
    # 5.open_timeが空では登録ができないこと
    it "is invalid without a open_time" do
      event = build(:event, open_time: "")
      event.valid?
      expect(event.errors[:open_time]).to include("を入力してください")
    end
    
    # 6.end_timeが空でも登録ができないこと
    it "is invalid without a end_time" do
      event = build(:event, end_time: "")
      event.valid?
      expect(event.errors[:end_time]).to include("を入力してください")
    end
    
    # 7.ownerが空では登録ができないこと
    it "is invalid without a owner" do
      event = build(:event, owner: "")
      event.valid?
      expect(event.errors[:owner]).to include("を入力してください")
    end
    
    # 8.descriptionが空では登録ができないこと
    it "is invalid without a description" do
      event = build(:event, description: "")
      event.valid?
      expect(event.errors[:description]).to include("を入力してください")
    end
    
    # 9.imageが空では登録ができないこと
    it "is invalid without a description" do
      event = build(:event, image: "")
      event.valid?
      expect(event.errors[:image]).to include("を入力してください")
    end

  end
end
