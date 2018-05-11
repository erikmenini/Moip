
Given("a new client was included") do
body = @Client.client_without_credit_card
@response = HTTParty.post(@base_url_client,:headers=>@headers,:basic_auth => @auth,:body => body)
end

Given("that i have a client with the id {string}") do |id|
    @response = HTTParty.get(@base_url_client + "#{id}",:headers=>@headers,:basic_auth => @auth)
  end
  
  Then("i validate the client data returned") do
    expect(@response.code).to eq(200)
	  expect(@response["fullname"]).to eq("Oliveira")
	  expect(@response['createdAt']).to eq('2018-05-06T14:22:34.000-03')
    expect(@response['birthDate']).to eq('1980-05-10')
    expect(@response['email']).to eq('maria@email.com')
  end

  Given("that i have a empty") do
    body = nil
    @response = HTTParty.post(@base_url_client,:headers=>@headers,:basic_auth => @auth,:body => body)
  end
  
  Given("a new client with credit card was included") do
    body = @Client.client_with_credit_card
    @response = HTTParty.post(@base_url_client,:headers=>@headers,:basic_auth => @auth,:body => body)
end