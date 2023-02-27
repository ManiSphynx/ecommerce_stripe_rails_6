class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_last_articles, only: %i[show current]

  def current
    @order = Order.where(user_id: current_user.id, status: 'created').order(updated_at: :desc).first
    @order ||= Order.create(user_id: current_user.id)
    render :show
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def set_last_articles
    @last_articles = Article.order(created_at: :desc).limit(3)
  end
end
