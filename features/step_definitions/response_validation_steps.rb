Then("show the error message for code {int}") do |code|
    if @response.code == code then 
        puts "Alguns campos não foram preenchidos corretamente"
    else 
        puts @response.code
    end
  end

  Then("i validate the response code {int}") do |code|
    expect(@response.code).to eq(code)
end