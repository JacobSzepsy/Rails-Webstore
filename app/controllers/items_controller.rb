class ItemsController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def index
    # @page = params[:page] ? params[:page] : 0
    # @items = Item.all.limit(3).offset(@page * 3)
    @items = Item.all
  end

  def create
    # TODO host image with url to allow stripe integration

    # Process input data
    file = item_params[:image].read()
    cost = item_params[:cost].gsub(/[.,]/,'').to_i
    image = Base64.encode64(file)
  
    # Create stripe product data
    product = Stripe::Product.create({name: item_params[:name]})
    price = Stripe::Price.create({
      unit_amount: cost,
      currency: 'usd',
      product: product[:id]
    })

    # Create item
    @item = Item.new(
      name: item_params[:name],
      cost: cost,
      description: item_params[:description],
      image: image,
      price_id: price[:id]
    )

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  private
    def item_params
      params.require(:item).permit(:name, :cost, :description, :image)
    end

    def authenticate
      redirect_to login_path unless logged_in?
    end
end
