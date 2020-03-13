require 'rails_helper'

describe EventsController, type: :controller do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # describe 'GET #edit' do
  #   it "assigns the requested event to @event" do
  #     event = create(:event)
  #     get :edit, params: { id: event }
  #     expect(assingns(:event)).to eq event
  #   end

  #   it "renders the :edit template" do
  #     event = create(:event)
  #     get :edit, params: { id: event }
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe 'GET #index' do
  #   it "populates an array of events ordered by date DESC" do
  #     events = create_list(:event, 3)
  #     get :index

  #     expect(assigns(:events)).to match(events.sort { |a, b| b.date <=> a.date })

  #   end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  
end
