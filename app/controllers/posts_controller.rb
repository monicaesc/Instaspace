class PostsController <ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to @post
    flash[:notice] = "Post created!"
  else
    redirect_back(fallback_location :root_path)
    flash[:alert] = "Post creation failed"
  end
end

  def destroy
    post = Post.find(params[:id])
    if current_user == post.user
    post.destroy
   redirect_to "/posts"
   flash[:notice] = "Post destroyed"
  else
    redirect_back(fallback_location: root_path)
    flash[:alert] = "Not authorized to delete post"
  end
end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to "/"
      flash[:alert] = "Unauthorized request"
  end
end

  def update
    post = Post.find(params[:id])
    if current_user == post.user
    post.update(update_params)
    redirect_to post
    flash[:notice] = "Update succesful!"
    else
    redirect_back(fallback_location: root_path)
    flash[:alert] = "Not authorized to update post"
  end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def update_params
    params.require(:post).permit(:caption)
  end
end
