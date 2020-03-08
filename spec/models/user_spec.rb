require 'rails_helper'

describe User do
  describe '#create' do
    # 1.name, email, password, password_confirmation, image, profile, inatagramが存在すれば登録できること
    it "is valid with a name, email, password, password_confirmation, image, profile, inatagram" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    # 2.nameが空では登録ができないこと
    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 3.emailが空では登録ができないこと
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4.passwordが空では登録ができないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5.password_confirmationが空では登録ができないこと
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6.profileが空では登録ができないこと
    it "is invalid without a profile" do
      user = build(:user, profile: "")
      user.valid?
      expect(user.errors[:profile]).to include("を入力してください")
    end

    # 7.重複したemailが存在する場合登録ができないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 8.passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 9.passwordが5文字以下の場合登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
    
  end
end
