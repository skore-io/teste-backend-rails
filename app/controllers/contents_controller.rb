class ContentsController < ApplicationController
  before_action :set_content, except: :create

  def create
    Contents::CreateService.new.perform(content_params)

    head :created
  end

  def show
    content = Contents::ShowService.new(@content).perform
   
    render json: content, status: 200
  end

  def update
    @content.update(content_params.merge(watched: false))
    head :no_content
  end

  def destroy
    @content.destroy
    head :no_content
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.permit(
      :name,
      :duration,
      :provider,
      :media_type,
      :provider_id,
      :expires_at
    )
  end
end
