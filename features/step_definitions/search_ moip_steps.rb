When("i click in pedidos") do
    @SearchMoip.pedidos_button.click
  end
  
  When("i search the order") do
    @SearchMoip.with(@orderId) 
  end
  
  When("i search the order in home page") do
    @SearchMoip.with_header(@orderId) 
  end

  Then("i validate the data") do
    assert_text @orderId
    assert_text 'Maria Oliveira'
    assert_text '100.133.900-23'
    assert_text 'maria@email.com'
  end

  When("i search the order with {string}") do |customer|
    @SearchMoip.with(customer) 
  end

  Then("i validate the message") do
    assert_text 'Não houve resultados para o filtro informado.'
  end
