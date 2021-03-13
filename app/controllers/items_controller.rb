class ItemsController < ApplicationController
  def index
    @categories = [
      'appareal',
      'electronics',
      'some random stuff'
    ]
    @items = [
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      },
      {
        name: 'some product',
        image: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        rating: rand(6),
        reviewCount: rand(1..3000),
        price: '$59.99'
      }
    ]
  end

  def create
    puts 'hello'
    file = item_params[:image].tempfile.open.read.force_encoding(Encoding::UTF_8)
    puts Base64.encode64(file)
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
