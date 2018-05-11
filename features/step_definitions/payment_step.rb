Given("a new payment with credit card is created") do
    body = @Payments.payment_credit_card (@hash)
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
end
  
  Given("a new payment with billet was included") do
    body = @Payments.payment_billet
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
  end
  
  Given("a new payment with debit was included") do
    body = @Payments.payment_debit
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
end
  
  Given("a new pre-approved payment was included") do
    body = @Payments.payment_pre (@hash)
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
  end

  Given("that i have the order {string}") do |orderIdPaid|
    body = @Payments.payment_credit_card(@hash)
    @response = HTTParty.post(@base_url_orders+ "#{orderIdPaid}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
    
  end
  
  Then("show the error message") do
    if @response.code == 404
    puts "Erro 404 - O pedido já foi pago"
        else if @response.code == 400
        puts "Não foi possível descriptografar o hash do cartão"
        end
    end
  end


  Given("i get an order from status") do
    @response = HTTParty.get(@base_url_orders+ "?status=CREATED",:headers=>@headers,:basic_auth => @auth)
  end
  
  Then("should have all orders") do
    puts @response
  end

  Given("a new debit payment with expire date {string} was included") do |expireDate|
    body = @Payments.payment_debit (expireDate)
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
  end

  Given("a new payment with wrong credit card is created") do
    hash = "HhL0kbhfid+jwgj5l6Kt9EPdetDxQN8s7uKUHDYxDC/XoULjzik44rSda3EcWuOcL17Eb8JjWc1JI7gsuwg9P0rJv1mJQx+d3Dv1puQYz1iRjEWWhnB1bw0gTvnnC/05KbWN5M8oTiugmhVK02Rt2gpbcTtpS7VWyacfgesBJFavYYMljYg8p2YGHXkXrMuQiOCeemKLk420d0OTMBba27jDVVJ663HZDrObnjFXJH/4B5irkj+HO5genV+V4PYoLcOESG4nrI3oFAsMGsLLcdJo0NNvkEmJpn0e9GzureKKFYisYU+BEd9EMr/odS0VMvOYRV65HbPTspIkjl2+3Q=="
    body = @Payments.payment_credit_card (hash)
    @response = HTTParty.post(@base_url_orders+ "#{@orderId}"+"/payments",:headers=>@headers,:basic_auth => @auth,:body => body)
end