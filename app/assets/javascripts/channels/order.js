App.order = App.cable.subscriptions.create("OrderChannel", {
  connected() {},
    // Called when the subscription is ready for use on the server

  disconnected() {},
    // Called when the subscription has been terminated by the server

  received(data) {
    return console.log(data['order']);
  },

  create(order) {
    return this.perform('create', {order});
  }
});

$(document).on('keypress', '[data-behavior~=order_creator]', function(event) {
	if (event.keyCode === 13) { 
		App.order.create(event.target.value);
		event.target.value = '';
		return event.preventDefault();
	}
});
