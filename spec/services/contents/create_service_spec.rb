require 'rails_helper'

RSpec.describe Contents::CreateService, type: :service do
  context 'When the valid params are passed' do
    it 'saves a new content in the database' do
      content = attributes_for(:content)

      expect{ described_class.new.perform(content) }.to change { Content.count }.by(1)
    end
  end
end