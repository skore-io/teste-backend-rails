class Content < ApplicationRecord
  validates :name, presence: true
  validates :duration, presence: true
  validates :provider, presence: true
  validates :media_type, presence: true
  validates :provider_id, presence: true
  validates :expires_at, presence: true

  validates_with Contents::ProviderValidator, on: :create
end
