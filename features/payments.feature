#encoding: utf-8

Feature: API Payment SandBox Moip
As Sandbox Moip admin i want to test the Payment

@newCreditCardPayment @payment @all
Scenario: New Payment with credit card
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new payment with credit card is created
Then  i validate the response code 201

@newBilletPayment @payment @all
Scenario: New Payment with billet
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new payment with billet was included
Then  i validate the response code 201

@newDebitPayment @payment @all
Scenario: New Payment with debit
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new debit payment with expire date "2018-05-20" was included
Then  i validate the response code 201

@newDebitPaymentWithExpireDate @payment 
Scenario: New Payment with debit
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new debit payment with expire date "2017-05-20" was included
Then  i validate the response code 400

@newPrePayment @payment 
Scenario: New pre-approved Payment
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new pre-approved payment was included
Then  i validate the response code 201

@OrderPaid  @payment 
Scenario: New payment of an Order that was already paid
Given that i have the order "ORD-C6YNHTFIO8PP" 
Then i validate the response code 400
And show the error message

@getOrdersp @payment 
Scenario: Get an order
Given i get an order from status
Then should have all orders

@newPaymentWithWrongCreditCard @payment 
Scenario: New Payment with wrong credit card
Given a new order with client "CUS-VBVB25KA7GD1" was created 
And a new payment with wrong credit card is created
Then show the error message