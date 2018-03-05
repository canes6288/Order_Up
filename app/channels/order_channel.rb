class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
  	ActionCable.server.broadcast 'order_channel', order: data['order']
  end
end
