class Payment

        def payment_credit_card (hash)
        @body_payment_credit_card=
        {  
            "installmentCount"=>6,
            "statementDescriptor"=>"Minha Loja",
            "fundingInstrument"=>{  
               "method"=>"CREDIT_CARD",
               "creditCard"=>{  
                  "hash"=> hash,
                  "store"=>true,
                  "holder"=>{  
                     "fullname"=>"Maria Oliveira",
                     "birthdate"=>"1980-05-10",
                     "taxDocument"=>{  
                        "type"=>"CPF",
                        "number"=>"10013390023"
                     },
                     "phone"=>{  
                        "countryCode"=>"55",
                        "areaCode"=>"11",
                        "number"=>"22849560"
                     },
                     "billingAddress"=>{  
                        "city"=>"Belo Horizonte",
                        "district"=>"Savassi",
                        "street"=>"Avenida Contorno",
                        "streetNumber"=>"400",
                        "zipCode"=>"76932800",
                        "state"=>"MG",
                        "country"=>"BRA"
                     }
                  }
               }
            },
            "device"=>{  
               "ip"=>"127.0.0.1",
               "geolocation":{  
                  "latitude"=>-33.867,
                  "longitude"=>151.206
               },
               "userAgent"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36",
               "fingerprint"=>"QAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolp"
            }
        }.to_json
        end

        def payment_billet
        @body_payment_billet=
        {  
            "statementDescriptor"=>"Minha Loja",
            "fundingInstrument"=>{ 
               "method"=>"BOLETO",
               "boleto"=>{  
                  "expirationDate"=>"2020-06-20",
                  "instructionLines"=>{  
                     "first"=>"Atenção,",
                     "second"=>"fique atento à data de vencimento do boleto.",
                     "third"=>"Pague em qualquer casa lotérica."
                  },
                  "logoUri"=>"http://www.lojaexemplo.com.br/logo.jpg"
               }
            }
        }.to_json
        end

        def payment_debit (expireDate)
        @body_payment_debbit=
        {  
            "fundingInstrument"=>{  
               "method"=>"ONLINE_BANK_DEBIT",
               "onlineBankDebit"=>{  
                  "bankNumber"=>341,
                  "expirationDate"=>expireDate
               }
            }
        }.to_json
        end

        def payment_pre (hash)
        @body_payment_pre=
        {  
            "installmentCount"=>3,
            "delayCapture"=>true,
            "statementDescriptor"=>"Minha Loja",
            "fundingInstrument"=>{  
               "method"=>"CREDIT_CARD",
               "creditCard"=>{  
                "hash"=> hash,
                "store"=>true,
                  "holder"=>{  
                    "fullname"=>"Maria Oliveira",
                    "birthdate"=>"1980-05-10",
                    "taxDocument"=>{  
                       "type"=>"CPF",
                       "number"=>"10013390023"
                     },
                     "phone":{  
                        "countryCode":"55",
                        "areaCode"=>"11",
                        "number"=>"22849560"
                     },
                     "billingAddress"=>{  
                        "city"=>"Belo Horizonte",
                        "district"=>"Savassi",
                        "street"=>"Avenida Contorno",
                        "streetNumber"=>"400",
                        "zipCode"=>"76932800",
                        "state"=>"MG",
                        "country"=>"BRA"
                     }
                  }
               }
            }
        }.to_json
        end
end
