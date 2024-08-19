class UsersController < ApplicationController
def show
end

def edit
  @user = current_user
   @tag = Tag.find_by(name: params[:tag])
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
end

def update
  @user = current_user
if @user.update(user_params)
  redirect_to root_path, notice: 'Profile was successfully updated.'
else
  render :edit
end
end

def likes
  @user = User.find(params[:id])
  @liked_posts = @user.liked_posts
end

  private

  def user_params
    params.require(:user).permit(:name, :caption, :profile_picture, :password, :email)
  end


end
