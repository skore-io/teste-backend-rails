require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:media_type) }
    it { should validate_presence_of(:provider_id) }
    it { should validate_presence_of(:expires_at) }

    context 'When the content already exists' do
      it 'validates that the provider_id is uniquness based on the provider' do
        create(:content, expires_at: Time.current)

        content = build(:content, expires_at: Time.current)

        content.valid?

        expect(
          content.errors.messages[:provider_id][0]
        ).to eq I18n.t(:provider_id_already_created, scope: 'activerecord.errors.models.content')
      end
    end

    context 'When the content is being created for the first time' do
      it 'creates a new content in database' do
        create(:content, expires_at: Time.current)
        content = build_stubbed(:content, expires_at: Time.current)
        content.provider_id = 'a123'

        content.valid?

        expect(content.errors.messages).to eq({})
      end
    end
  end
end
