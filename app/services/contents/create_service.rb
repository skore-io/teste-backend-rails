module Contents
  class CreateService
    def perform(params)
      Content.create!(
        params.merge(
          expires_at: parse_expires_at_to_timestamp(params[:expires_at])
        )
      )
    end

    private

    def parse_expires_at_to_timestamp(expires_at)
      Time.zone.at(expires_at.to_i)
    end
  end
end