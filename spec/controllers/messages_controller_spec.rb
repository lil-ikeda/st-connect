require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  describe '#create' do
    context 'log in' do
      before do
        login_user user
      end
      context 'can save' do
        # 保存に成功した場合
        it 'count up message' do
          expect{
            post :create, params: {
              message: {
                content: "コメントのテキスト",
                user_id: 1,
                room_id: 1
              }
            }
          }
        end
      end
    end
  end
end