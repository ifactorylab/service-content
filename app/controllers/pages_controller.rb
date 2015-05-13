class PagesController < ApplicationController
  before_action :set_site, :only => :index
  before_action :set_page, :only => [:update, :upload]

  # curl -v -XGET localhost:3000/sites/2a014646-ca54-4cdb-b004-76be3383cf0b/pages -H 'Venice-Authorization: cee3eb61-2435-4a28-b422-9ebfacc8dbec'
  def index
    render json: { pages: @site.pages.order(order: :asc) }, status: 200
  end

  def show
  end

  def create
  end

  # curl -v -XPUT -F "file=@/Users/minkim/Desktop/download.jpeg" "http://localhost:3000/pages/70566ae1-3f4d-41fb-baa7-89b7c513824c/background"
  def upload
    @page.background = params[:file]
    @page.save!
    puts @page.background.url
    puts @page.background.current_path
  end

  def update
    @page.update!(update_params)
    render nothing: true, status: 200
  end

  private

  def set_page
    @page ||= Page.find(params[:id])
  end

  def set_site
    @site ||= Site.find(params[:site_id])
  end

  def create_params
    hash = params.require(:page).permit(:title, :description, :background_url, :order)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!({ site_id: params[:site_id] })
  end

  def update_params
    hash = params.require(:page).permit(:title, :description, :background_url, :order)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash
  end
end
