class ContentsController < ApplicationController
  before_action :set_page, :only => :index
  before_action :set_content, :only => :update

  def index
    render json: { contents: @page.contents.order(order: :asc) }, status: 200
  end

  def show
  end

  def create
  end

  def update
    @content.update!(update_params)
    render nothing: true, status: 200
  end

  private

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
