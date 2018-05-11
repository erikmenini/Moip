  Given("a new order with client {string} was created") do |client|
    body = @Order.order_with_client(client) 
    @response = HTTParty.post(@base_url_orders,:headers=>@headers,:basic_auth => @auth,:body => body)
    @orderId = @response['id']
    puts @orderId
  end
  
  Given("i get an order {string}") do |orderId|
    @response = HTTParty.get(@base_url_orders+ "#{orderId}",:headers=>@headers,:basic_auth => @auth)
  end
  
  Then("i validate the order data") do
    expect(@response.code).to eq(200)
	  expect(@response['ownId']).to eq('74332')
    expect(@response['status']).to eq('WAITING')
    expect(@response['createdAt']).to eq('2018-05-08T00:34:47.000-03')
  end
  
  Given("a order {string} with moip checkout with a customer {string}") do |order, client|
    body = @Order.order_with_moip_checkout(order, client) 
    @response = HTTParty.post(@base_url_orders,:headers=>@headers,:basic_auth => @auth,:body => body)
  end
  
  Given("an order with a new client") do
    body = @Order.order_with_new_client 
    @response = HTTParty.post(@base_url_orders,:headers=>@headers,:basic_auth => @auth,:body => body)
  end