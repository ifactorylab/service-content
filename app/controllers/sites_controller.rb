class SitesController < ApplicationController
  before_action :set_site

  def show
    render json: { site: @site.to_h }, status: 200
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end
end
