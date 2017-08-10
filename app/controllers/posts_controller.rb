class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!"
      render :new
    end
  end

  def show
    set_post
  end

  def edit
    set_post
  end

  def update
    set_post
    @post.update(post_params)
    flash[:success] = "Post updated!"
    redirect_to(post_path(@post))
  end

  def destroy
    set_post
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
