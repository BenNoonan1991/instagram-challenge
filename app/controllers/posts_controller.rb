class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Thanks for posting!"
      redirect_to @post
    else
      flash[:alert] = "Posts must contain an image"
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
