class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      redirect_to @blogger
    else
      render 'new'
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    # @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    if @blogger.valid?
      redirect_to @blogger
    else
      redirect_to edit_blogger_path
    end
  end

  def destroy
    @blogger.destroy
    redirect_to bloggers_path
  end

    private
      def set_blogger
        @blogger = Blogger.find(params[:id])
      end

      def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
      end

end
