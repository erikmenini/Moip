#encoding: utf-8

Feature: API Customers SandBox Moip
As Sandbox Moip admin i want to controll the client page

@includeClientWithoutCreditCard @client @all
Scenario: New Client
Given a new client was included
Then  i validate the response code 201

@includeClientWithCreditCard @client
Scenario: New Client
Given a new client with credit card was included
Then  i validate the response code 201

@getClient @client
Scenario: Get a Client
Given that i have a client with the id "CUS-8N55I5VRD0OC"
Then i validate the client data returned

@includeClienteWithoutBody @client 
Scenario: Include a Client with a wrong Body
Given that i have a empty
Then i validate the response code 400
And show the error message for code 400