class Orders

  def order_with_client (client)
    @body_order_with_client=
    {
      "ownId": Faker::Number.number(5),
      "amount": {
        "currency": "BRL",
        "subtotals": {
          "shipping": Faker::Number.number(3),
        }
      },
      "items": [
        {
          "product": Faker::Vehicle.manufacture,
          "category": "CAMERAS",
          "quantity": Faker::Number.number(1),
          "detail": Faker::Dune.quote,
          "price": Faker::Number.number(4)
        }
      ],
      "customer": {
        "id": client
      }
    }.to_json
  end

  def order_with_new_client
  @body_order_with_new_client=
  {
    "ownId"=>Faker::Number.number(5),
    "amount"=>{
      "currency"=>"BRL",
      "subtotals"=>{
        "shipping"=> Faker::Number.number(3),
      }
    },
    "items"=>[
      {
        "product"=>Faker::Vehicle.manufacture,
        "category"=>"CAMERAS",
        "quantity"=>Faker::Number.number(1),
        "detail"=>Faker::Dune.quote,
        "price"=> Faker::Number.number(4)
      }
    ],
    "customer"=>{
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
      "shippingAddress"=> {
        "street"=>Faker::Address.street_address,
        "streetNumber"=>Faker::Address.building_number,
        "complement"=>Faker::Address.secondary_address,
        "district"=>Faker::Address.street_name,
        "city"=>Faker::Address.city,
        "state"=>Faker::Address.state_abbr,
        "country"=>Faker::Address.country_code_long,
        "zipCode"=>Faker::Address.zip
      }
    }
  }.to_json
  end

  def order_with_moip_checkout (order, client)
    @body_order_with_moip_checkout=
    {  
      "ownId":"meu_id_order",
      "amount":{  
         "currency":"BRL",
         "subtotals":{  
            "shipping":1500
         }
      },
      "items":[  
         {  
            "product":"Nome do produto",
            "category":"APPAREL_AND_ACCESSORIES",
            "subcategory":"CLOTHING",
            "quantity":1,
            "detail":"Camiseta estampada branca",
            "price":9500
         }
      ],
      "customer":{  
         "id":client
      },
      "checkoutPreferences":{  
         "redirectUrls":{  
            "urlSuccess": "http://www.lojaexemplo.com.br/compraFeita",
            "urlFailure": "http://www.lojaexemplo.com.br/error"
         },
         "installments":[  
            {  
               "quantity":[2,2],
               "addition":1000
            }
         ]
      }
   }.to_json
  end

end