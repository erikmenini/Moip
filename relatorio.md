<h1>Relatório erro 5XX</h1>

<h2>ERRO 500</h2>

Teste que ocorreu o erro:
--------------------------
```bash
@createOrderWithANewClient @orders 
Scenario: Create an order with a new client
Given an order with a new client
Then i validate the response code 201
```

JSON passado no body para realização do POST:
---------------------------------------------
```bash
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
  ```