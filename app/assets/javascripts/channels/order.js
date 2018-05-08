App.order = App.cable.subscriptions.create("OrderChannel", {
  connected() {
  	console.log('connected')
  },
    // Called when the subscription is ready for use on the server

  disconnected() {
  	console.log('disconnected')
  },
    // Called when the subscription has been terminated by the server

  received(data) {
  	$('.orders').append(data['html'])
    $('.new-order').remove()
    var newOrderHtml = "<div class='row new-order'><div class='col-md-12'><p class='alert alert-success'>New Order!</p></div></div>"
    $('.order:last').before(newOrderHtml)
  
    $("#topbar").slideToggle().delay(6000).slideToggle();
  },
});