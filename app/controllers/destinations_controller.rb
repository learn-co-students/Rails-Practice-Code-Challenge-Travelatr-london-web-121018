class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show
    # @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.valid?
      redirect_to @destination
    else
      render 'new'
    end
  end

  def edit
    # @destination = Destination.find(params[:id])
  end

  def update
    # @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    if @destination.valid?
      redirect_to @destination
    else
      redirect_to edit_destination_path
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end

  private
    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:name, :country)
    end

end
