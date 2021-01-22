require 'rails_helper'

RSpec.describe HelloService, type: :service do
   describe '#perform' do
    context 'when is valid' do
      it 'must return true' do
        service = HelloService.new

        expect(service.perform).to be true
      end
    end
  end
end
