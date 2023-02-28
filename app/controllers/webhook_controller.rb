class WebhookController < ApplicationController
  protect_from_forgery except: :receive # Disable CSRF protection for this action

  def receive
    event_string = request.body.read
    event = Stripe::Event.construct_from(JSON.parse(event_string, symbolize_names: true)) # Parse the event to a Stripe Event object with symbolized keys

    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # Retrieve the PaymentIntent object
      order = Order.find_by(stripe_payment_id: payment_intent.id)
      order.update(status: payment_intent.status)
    end
  end
end
