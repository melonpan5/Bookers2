class HomesController < ApplicationController
	def index
	end
	def about
	end

	def create
     @user = User.new
     if @user.save
      redirect_to user_path(@user.id)
      flash[:notice] = 'successfully'
     else
      render :index
     end
   end

end
