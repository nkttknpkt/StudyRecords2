class ToppagesController < ApplicationController
  def index
    if logged_in?
      @learn = current_user.learns.build  # form_with 用
      @pagy, @learns = pagy(current_user.learns.order(id: :desc))
    end
  end
end
