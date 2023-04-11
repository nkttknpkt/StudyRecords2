class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    learn = Learn.find(params[:learn_id])
    current_user.favorite(learn)
    flash[:success] = 'いいねしました!'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    learn = Learn.find(params[:learn_id])
    current_user.unfavorite(learn)
    flash[:success] = 'いいねを解除しました!'
    redirect_back(fallback_location: root_path)
  end
end
