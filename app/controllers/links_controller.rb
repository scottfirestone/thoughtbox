class LinksController < ApplicationController

  def index
    unless current_user
      redirect_to login_path
    end
    @links = Link.all
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "New Link Added"
      redirect_to links_path
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end


end
