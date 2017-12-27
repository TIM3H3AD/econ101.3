class PostsController < ApplicationController
 before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
      @post = current_user.created_posts.build(post_params)
      if @post.save
      flash[:success] = "You have added a new Post!"
      redirect_to @post #things_path later
    else
      flash[:danger] = "The form contains errors"
      render :new
    end
  end

  def index
  @posts = current_user.posts
  end

  def show
  @post = Post.find(params[:id])
  end

  def edit
@user = current_user
  @post = Post.find(params[:id])
  end

  def update
  @user = current_user
  @post = Post.find(params[:id])  
  if @post.update_attributes(post_params)
      flash[:success] = "Update successful"
      redirect_to @post
    else
      flash[:danger] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.destroy
      flash[:success] = "Your Post was deleted successfully"
      redirect_to root_url
    else
      flash[:danger] = "Could not delete"
      render @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:picture, :hashtag, :creator_id)
  end

  def correct_user
  @post = Post.find(params[:id])
    if current_user != @post.creator
      flash[:danger] = "You don't have permission to do that."
      redirect_to root_url
    end
  end
end
