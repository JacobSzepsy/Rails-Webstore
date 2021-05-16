class ItemsController < ApplicationController
  def index
    @categories = [
      'appareal',
      'electronics',
      'some random stuff'
    ]
    @items = [
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 6
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 59999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      },
      {
        id: 1,
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: 5999
      }
    ]
  end

  def create
    # TODO host image with url to allow stripe integration

    # Process input data
    file = item_params[:image].read()
    cost = item_params[:cost].gsub(/[.,]/,'').to_i

    # Create stripe product data
    product = Stripe::Product.create({name: item_params[:name]})
    price = Stripe::Price.create({
      unit_amount: cost,
      currency: 'usd',
      product: product[:id]
    })

    # Create item
    @item = Item.create(
      name: item_params[:name],
      cost: cost,
      description: item_params[:description],
      image: item_params[:image],
      price_id: price[:id]
    )

    redirect_to @item
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
end
