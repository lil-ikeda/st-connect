require 'rails_helper'

describe Message do
  describe '#create' do
    let(:message) { FactoryBot.create(:message) }

    # 1.name, email, password, password_confirmation, image, profile, inatagramが存在すれば登録できること
    it "is valid with a content, room_id, user_id" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    # 2.nameが空では登録ができないこと
    it "is invalid without a content" do
      message = build(:message, content: "")
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end


  end
end
