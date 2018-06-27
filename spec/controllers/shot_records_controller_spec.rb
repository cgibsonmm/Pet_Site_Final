require 'rails_helper'

RSpec.describe ShotRecordsController, type: :controller do

  describe "GET #create" do
    xit"returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
