#encoding: utf-8

Feature: API Customers SandBox Moip
As Sandbox Moip admin i want to controll the orders page

@includeOrderWithClient @orders
Scenario: New Order with an existing client
Given a new order with client "CUS-PTI2SAWD447R" was created 
Then  i validate the response code 201

@getOrder @orders
Scenario: Get an specific order
Given i get an order "ORD-C6YNHTFIO8PP"
Then i validate the order data

@createOrderWithMoipCheckout @orders 
Scenario: Create a new order with moip checkout
Given a order "99999" with moip checkout with a customer "CUS-PTI2SAWD447R"
Then i validate the response code 201

@createOrderWithANewClient @orders 
Scenario: Create an order with a new client
Given an order with a new client
Then i validate the response code 201


