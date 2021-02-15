class ContentsController < ApplicationController
  def create
    Contents::CreateService.new.perform(content_params)
    head :created
  end

  private

  def content_params
    params.permit(:name, :durations, :provider, :media_type, :provider_id, :expires_at, :watched, :expired)
  end
end
