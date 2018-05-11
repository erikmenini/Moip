class Client

    def client_without_credit_card
    @body_without_credit = 
    {
        "ownId"=>Faker::Number.number(5),
        "fullname"=>Faker::Name.name,
        "email"=>Faker::Internet.email,
        "birthDate"=>Faker::Date.birthday(18, 65),
        "taxDocument"=>{
          "type"=>"CPF",
          "number"=>Faker::CPF.numeric
        },
        "phone"=>{
            "countryCode"=>Faker::PhoneNumber.subscriber_number(2),
            "areaCode"=>Faker::PhoneNumber.area_code,
            "number"=>Faker::PhoneNumber.phone_number
        },
        "shippingAddress"=>{
          "city"=>Faker::Address.city,
          "complement"=>Faker::Address.secondary_address,
          "district"=>Faker::Address.street_name,
          "street"=>Faker::Address.street_address,
          "streetNumber"=>Faker::Address.building_number,
          "zipCode"=>Faker::Address.zip,
          "state"=>Faker::Address.state_abbr,
          "country"=>Faker::Address.country_code_long
        }
    }.to_json
    return @body_without_credit
    end

    def client_with_credit_card
        {  
            "ownId"=>Faker::Number.number(5),
            "fullname"=>Faker::Name.name,
            "email"=>Faker::Internet.email,
            "birthDate"=>Faker::Date.birthday(18, 65),
            "taxDocument"=>{  
               "type"=>"CPF",
               "number"=>Faker::CPF.numeric
            },
            "phone":{  
               "countryCode"=>Faker::PhoneNumber.subscriber_number(2),
               "areaCode"=>Faker::PhoneNumber.area_code,
               "number"=>Faker::PhoneNumber.phone_number
            },
            "shippingAddress":{  
               "city"=>Faker::Address.city,
               "district"=>Faker::Address.street_name,
               "street"=>Faker::Address.street_address,
               "streetNumber"=>Faker::Address.building_number,
               "zipCode"=>"02446000",
               "state"=>Faker::Address.state_abbr,
               "country"=>Faker::Address.country_code_long
            },
            "fundingInstrument"=>{  
                "method"=>"CREDIT_CARD",
                "creditCard"=>{  
                   "expirationMonth"=>"06",
                   "expirationYear"=>"22",
                   "number"=>"6362970000457013",
                   "cvc"=>"123",
                   "holder"=>{  
                      "fullname"=>"Maria Oliveira",
                      "birthdate"=>"1980-05-10",
                      "taxDocument"=>{  
                         "type"=>"CPF",
                         "number"=>"10013390023"
                     },
                     "billingAddress":{  
                        "city"=>Faker::Address.city,
                        "district"=>Faker::Address.street_name,
                        "street"=>Faker::Address.street_address,
                        "streetNumber"=>Faker::Address.building_number,
                        "zipCode"=>"02446000",
                        "state"=>Faker::Address.state_abbr,
                        "country"=>Faker::Address.country_code_long
                     },
                     "phone":{  
                        "countryCode"=>Faker::PhoneNumber.subscriber_number(2),
                        "areaCode"=>Faker::PhoneNumber.area_code,
                        "number"=>Faker::PhoneNumber.phone_number
                     }
                  }
               }
            }
         }.to_json   
    end
end