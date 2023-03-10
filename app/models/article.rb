class Article < ApplicationRecord
  # CALLBACKS
  before_save :add_body_preview, if: :body?
  after_create :create_stripe_product, if: :private?

  # SCOPES
  scope :free, -> { where(private: false) }
  scope :paid, -> { where(private: true) }

  # METHODS
  def add_body_preview
    self.body_preview = body[0..150]
  end

  def create_stripe_product
    product = Stripe::Product.create({ name: "Article #{id}" })
    pricing = Stripe::Price.create({ product: product.id, unit_amount: price, currency: 'usd' })
    update(stripe_product_id: product.id, stripe_pricing_id: pricing.id)
  end

  def tag
    { class: tag_class, name: tag_name }
  end

  private

  def tag_name
    private ? 'Locked' : 'Free'
  end

  def tag_class
    return 'bg-red-200 text-red-600' unless private

    'bg-blue-200 text-blue-600'
  end
end
