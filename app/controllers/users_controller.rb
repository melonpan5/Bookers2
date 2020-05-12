class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new = Book.new
    #@books = Book.where(user_id: params[:id])
    #@current_user = User.find(current_user.id)
  end


  def edit
        @user = User.find(current_user.id)
  end
  
  def update
  	 @user = User.find(params[:id])
     if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = 'successfully　更新しました'
   else
    render :edit
   end
  end

  def index
    @user = User.find(current_user.id)
  	@users = User.all
    @new = Book.new
  end

  def destroy
     @user = User.find(params[:id])
     if @user.destroy
    redirect_to homes
    flash[:notice] = 'Signed out successfully'
   else
    render :show
   end
  end

private
 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

 protected
  # アカウント編集後、マイページへに移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

end
