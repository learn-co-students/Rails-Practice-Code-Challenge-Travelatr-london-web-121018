class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    # @destination = Destination.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
          @post.update(post_params)
      if @post.valid?
        redirect_to @post
      else
        redirect_to edit_post_path
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
      end


end
