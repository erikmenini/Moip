Given("i try to access the API with user {string} and password {string}") do |user, pass|
    @auth = {username: user, password: pass}
    @options = {
    :header => {'Content-Type' => 'application/json'},
    :basic_auth => @auth,
}
@response = HTTParty.get("https://sandbox.moip.com.br/v2/customers", @options)
  end

  Given("i see the response code {int}") do |code|
    puts @response.code
    expect(@response.code).to eq(code)
  end
  
  Then("i get the validation message {string}") do |message|
    puts @response.parsed_response
    expect(@response.parsed_response).to eq(message)
  end

  Given("i try to acess the API with the correct credentials") do
    @response = HTTParty.get("https://sandbox.moip.com.br/v2/customers", :headers=>@headers,:basic_auth => @auth)
  end
  
  Then("i get the code {int}") do |code|
    expect(@response.code).to eq(200)
  end