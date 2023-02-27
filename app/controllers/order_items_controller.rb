class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    order_item = current_order.order_items.new(article_id: order_item_params)

    if order_item.save
      redirect_to current_order, notice: 'Article added to cart'
    else
      redirect_to articles_path(id: order_item_params), alert: 'Article was not added to cart'
    end
  end

  private

  def current_order
    order = Order.where(user_id: current_user.id, status: 'created').order(updated_at: :desc).first
    order || Order.create(user_id: current_user.id)
  end

  def order_item_params
    params.require(:article_id)
  end
end
