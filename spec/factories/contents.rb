FactoryBot.define do
  factory :content do
    name  { "GOTO 2017 • The Many Meanings of Event-Driven Architecture • Martin Fowler" }
    duration { 3006 }
    provider { "youtube" }
    provider_id { "STKCRSUsyP0" }
    media_type { "video" }
    expires_at { 1580428851394 }
    watched { false }
    expired { false }
  end
end
