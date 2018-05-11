Given("i access the login Page") do
    @Login.load
  end
  
  Given("i have the login, password with the data:") do |table|
    @user = table.hashes[0]['login']
    @password = table.hashes[0]['password']
  end
 
  Given("i click in acessar sua conta") do
    @Login.with(@user,@password)
  end
  
  Then("i should see {string} na home page") do |message|
    assert_text message
end
  
  Given("i fill the {string}, {string} with the data:") do |user, pass|
    @user = user
    @password = pass
  end

  Then("a should see {string}") do |message|
    assert_text message
  end