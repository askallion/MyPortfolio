class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def top
  @user = current_user
  @posts = Post.page(params[:page]).reverse_order
   @tag = Tag.find_by(name: params[:tag])
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
end


def after_sign_in_path_for(resource)
    root_path
end

def after_sign_up_path_for(resource)
    root_path # 例: ウェルカムページにリダイレクト
end

protected

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end



end
