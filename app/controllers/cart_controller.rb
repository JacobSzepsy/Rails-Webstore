class CartController < ApplicationController
	def create
		cart = session[:cart]
		
		# set default values if none exist
		cart ||= Hash.new()
		cart[params[:id]] ||= { 'price' => params[:id], 'quantity' => 0 }
		cart[params[:id]]['quantity'] += params[:quantity].to_i

		session[:cart] = cart
		redirect_to action: 'index'
	end

	def update
		cart = session[:cart]
		cart ||= hash.new()

		if cart.key?(params[:id])
			cart[params[:id]]['quantity'] = params[:quantity].to_i
		end

		session[:cart] = cart
		redirect_to action: 'index'
	end
	
	def destroy
		cart = session[:cart]
		cart ||= hash.new()
		
		if cart.key?(params[:id])
			cart.delete(params[:id])
		end

		session[:cart] = cart
		redirect_to action: 'index'
	end

	def index
		sessionHash = session[:cart]
		sessionHash ||= Hash.new()
		items = sessionHash.keys
		@subtotal = 0
		@cart = Item.where('price_id in (?)', items ||= []).as_json.each do |item|
			puts(item['cost'])
			item['quantity'] = sessionHash[item['price_id']]['quantity']
			@subtotal += item['cost'] * item['quantity']
		end
	end
end