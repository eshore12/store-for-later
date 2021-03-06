class StoresController < ApplicationController
  def index
    @stores = Store.all
    @markers = @stores.geocoded.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude
      }
    end
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(stores_params)
    if @store.save
      redirect_to store_path(@store)
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.save
    redirect_to stores_path
  end

  private

  def stores_params
    params.require(:store).permit(:name, :photo, :longitude, :latitude )
  end
end
