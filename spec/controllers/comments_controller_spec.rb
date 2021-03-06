require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:comment) { create(:comment) }

  describe '#create' do
    context 'log in' do
      before do
        login_user user
      end
      context 'can save' do
        # 保存に成功した場合
        it 'count up comment' do
          expect{
            post :create, params: {
              comment: {
                text: "コメントのテキスト",
                user_id: 1,
                event_id: 2
              }
            }
          }
        end
      end
    end
  end
end