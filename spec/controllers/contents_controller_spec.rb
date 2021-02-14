require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'POST create' do
    it 'returns a 201' do
      post contents_path 
    end
  end
end
