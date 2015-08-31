class ContentsController < ApplicationController
  before_action :set_page, :only => :index
  before_action :set_content, :only => [:update, :upload]
  before_action :set_site, :only => :booking
  before_action :authorize_partner

  def index
    render json: { contents: @page.contents.order(order: :asc) }, status: 200
  end

  def show
  end

  # curl -v -XGET localhost:3000/sites/2a014646-ca54-4cdb-b004-76be3383cf0b/contents/booking
  def booking
    page = @site.pages.where(order: 2).first
    unless page
      head 404
    else
      render json: { content: Content.where(page_id: page.id, order: 0).first }
    end
  end

  def create
  end

  # curl -v -XPATCH -F "file=@/Users/minsikzzang/Desktop/download.jpeg" "http://localhost:3000/contents/70566ae1-3f4d-41fb-baa7-89b7c513824c/image"
  def upload
    @content.image = params[:file]
    @content.save!
  end

  def update
    @content.update!(update_params)
    render nothing: true, status: 200
  end

  private

  def set_site
    @site ||= Site.find(params[:id])
  end

  def set_page
    @page ||= Page.find(params[:page_id])
  end

  def set_content
    @content ||= Content.find(params[:id])
  end

  def create_params
    hash = params.require(:content).permit(:title, :description, :image_url, :order)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!({ page_id: params[:page_id] })
  end

  def update_params
    hash = params.require(:content).permit(:title, :image_url, :order)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!(params.require(:content).permit(:description))
    hash
  end
end
