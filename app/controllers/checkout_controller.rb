class CheckoutController < ApplicationController
  
  YOUR_DOMAIN = 'http://localhost:3000'.freeze

  def create
    cart = session[:cart].values

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: cart,
      mode: 'payment',
      success_url: YOUR_DOMAIN + '/checkout/success.html',
      cancel_url: YOUR_DOMAIN + '/',
    })

    render :json => { id: session.id }
  end

  def success
    session[:cart] = Hash.new()
  end

  def cancel
  end
end
