class LinksController < ApplicationController

  def index
    unless current_user
      redirect_to new_session_path
    end
  end

end
