require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'POST create' do
    let(:contents) { attributes_for(:content) } 

    before(:each) do
      post :create, params: contents
    end

    it 'returns a 201' do
      expect(response).to have_http_status(:created)
    end

    it 'saves the correct expires_at value' do
      expect(Content.last.expires_at).to eq Time.zone.at(contents[:expires_at].to_i)
    end
  end
end
