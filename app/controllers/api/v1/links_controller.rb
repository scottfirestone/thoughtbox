class Api::V1::LinksController < Api::ApiController
  respond_to :json

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      respond_with link, location: nil
    end
  end

  private
    def link_params
      params.require(:thought).permit(:url, :title)
    end
end
