class LearnsController < ApplicationController
 before_action :require_user_logged_in
 before_action :correct_user, only: [:destroy]

 def create
   @learn = current_user.learns.build(learn_params)
   if @learn.save
    flash[:success] = '勉強記録を作成しました。'
    redirect_to root_url
   else
    @pagy, @learns = pagy(current_user.feed_learns.order(id: :desc))
    flash.now[:danger] = '勉強記録の作成に失敗しました。'
    render 'toppages/index'
   end
 end

 def destroy
   @learn.destroy
   flash[:success] = '勉強記録を削除しました。'
   redirect_back(fallback_location: root_path)
 end

 private

 def learn_params
   params.require(:learn).permit(:studydate, :content)
 end

 def correct_user
   @learn = current_user.learns.find_by(id: params[:id])
   unless @learn
     redirect_to root_url
   end
 end
end
