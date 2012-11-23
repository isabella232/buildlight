require 'spec_helper'

describe WebhooksController do
  describe 'POST create' do
    it 'recieves a json payload' do
      post :create, payload: json_fixture('travis.json')
      expect(response).to be_success
    end

    it 'saves useful data' do
      post :create, payload: json_fixture('travis.json')
      status = Status.order("created_at DESC").first
      expect(status.status).to eq("green")
      expect(status.project_id).to eq("347744")
      expect(status.project_name).to eq("buildlight")
    end
  end
end