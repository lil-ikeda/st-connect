require 'rails_helper'

describe EventsController, type: :controller do
  let(:user) { create(:user) }

  before do
    login_user user
  end

  describe 'GET #index' do
    it "populates an array of events ordered by date ASC" do
    rescue RSpec::Expectations::ExpectationNotMetError => e
      events = create_list(:event, 3)
      get :index
      expect(assigns(:events)).to match(events)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    context 'log in' do
      # ログインしている場合
      before do
        login_user user
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
    context 'not log in' do
      # ログインしてなかった場合
      it 'redirects to root_path' do
        get :new
        expect(response).to redirect_to 
      end
    end
  end

  describe '#create' do
    context 'log in' do
      # ログインしている場合
      before do
        login_user user
      end
      context 'can save' do
        # 保存に成功した場合
        it 'count up event' do
          expect{
            post :create, params: {
              event: {
                name: "イベントタイトル",
                date: "2020-03-20",
                image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
                place: "東京都渋谷区",
                open_time: '11:20:00',
                end_time: '11:20:00',
                owner: 1,
                description: "イベントの詳細説明"
              }
            }
          }
        end
        it 'redirects to root_path' do
          post :create, params: {
            event: {
              name: "イベントタイトル",
              date: "2020-03-20",
              image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
              place: "東京都渋谷区",
              open_time: '11:20:00',
              end_time: '11:20:00',
              owner: 1,
              description: "イベントの詳細説明"
            }
          }
          expect(response).to redirect_to(root_path)
        end
      end
      context 'can not save' do
      # 保存に失敗した場合
        it 'does not count up' do
          expect{
            post :create, params: {
              event: {
                name: "",
                date: "2020-03-20",
                image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
                place: "東京都渋谷区",
                open_time: '11:20:00',
                end_time: '11:20:00',
                owner: 1,
                description: "イベントの詳細説明"
              }
            }
          }.not_to change(Event, :count)
        end
        it 'renders new' do
          post :create, params: {
            event: {
              name: "",
              date: "2020-03-20",
              image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
              place: "東京都渋谷区",
              open_time: '11:20:00',
              end_time: '11:20:00',
              owner: 1,
              description: "イベントの詳細説明"
            }
          }
          expect(response).to render_template :new
        end
      end
    end
  end

  describe 'GET #show' do
  
  end

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "assigns the requested event to @event" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(assigns(:event)).to eq event
    end
    
    it "renders the :edit template" do
      event = create(:event)
      get :edit, params: { id: event }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #update' do
  
  end

  describe 'DELETE #destroy' do

  end

  
end
