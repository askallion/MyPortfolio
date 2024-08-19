class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @post = Post.new
    @tags = Tag.all
     @tag = Tag.find_by(name: params[:tag])
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      @tags = Tag.all
      flash.now[:alert] = 'Failed to create post. Please check the input fields.'
      render :new
    end
  end


  def index
   @user = current_user
   @tag = Tag.find_by(name: params[:tag])
   @posts = Post.page(params[:page]).reverse_order
  end

  def index_red
     @tag = Tag.find_by(name: 'red')
     @posts = Post.where(tag_id: @tag.try(:id))
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end

  def index_blue
     @tag = Tag.find_by(name: 'blue')
     @posts = Post.where(tag_id: @tag.try(:id))
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end

  def index_green
     @tag = Tag.find_by(name: 'green')
     @posts = Post.where(tag_id: @tag.try(:id))
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end

  def index_mono
      @tag = Tag.find_by(name: 'mono')
      @posts = Post.where(tag_id: @tag.try(:id))
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end


  def show
     @posts = Post.all
     @post = Post.find(params[:id])
     @user = User.find_by(id: @post.user_id)
      @tag = Tag.find_by(name: params[:tag])
    @default_color = '#343a40' # デフォルトのbg-dark色 (#343a40) を設定
  end

  def destroy
     @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :body, :tag_id)
  end

  def set_tag
    @tag = Tag.find(params[:post][:tag_id])
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end

end