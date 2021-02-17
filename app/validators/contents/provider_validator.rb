module Contents
  class ProviderValidator < ActiveModel::Validator
    def validate(record)
      content = record.class.find_by(provider: record.provider, provider_id: record.provider_id)

      return true if content.nil?

      record.errors.add(:provider_id, :provider_id_already_created)
    end
  end
end