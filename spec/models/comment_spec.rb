# require 'rails_helper'

# describe Comment do
#   describe '#create' do
#     # 1.text, user_id, event_idが存在すれば登録できること
#     it "is valid with a text, user_id, event_id" do
#       comment = build(:comment)
#       comment.valid?
#       expect(comment).to be_valid
#     end

#     # 2.textが空では登録ができないこと
#     it "is invalid without a text" do
#       comment = build(:comment, text: "")
#       comment.valid?
#       expect(comment.errors[:text]).to include("を入力してください")
#     end

#     # 3.user_idが空では登録ができないこと
#     it "is invalid without a user_id" do
#       comment = build(:comment, user: "")
#       comment.valid?
#       expect(comment.errors[:user_id]).to include("を入力してください")
#     end

#     # 4.event_idが空では登録ができないこと
#     it "is invalid without a event_id" do
#       comment = build(:comment, event_id: "")
#       comment.valid?
#       expect(comment.errors[:event_id]).to include("を入力してください")
#     end

#   end
# end
