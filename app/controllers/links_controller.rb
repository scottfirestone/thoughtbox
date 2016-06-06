class LinksController < ApplicationController
  def index
    unless current_user
      redirect_to login_path
    end
    if current_user && current_user.links
      @links = current_user.links.all
    end
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.update_attributes(user_id: current_user.id)
    if @link.save
      flash[:success] = "New Link Added"
      redirect_to links_path
    else
      flash.now[:danger] = "There was a problem with your submission."
      render :index
    end
  end

  def update
    link = Link.find(params[:id])
    if params[:clicked]
      read_property = !link.read
      link.update_attributes(read: read_property)
      flash[:success] = "Link marked as read!"
    end
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end
end
