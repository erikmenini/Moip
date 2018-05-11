Feature: Searching an order in Moip
As Sandbox Moip admin i want to search an account

Background:
Given i access the login Page
Given i have the login, password with the data:
    |login                 |password    |
    | erikmenini@gmail.com |ERik12111990|

@searchAnOrderInMoip @seach_Moip_sandbox 
Scenario: Searchh an order in moip
When i click in acessar sua conta
And a new order with client "CUS-VBVB25KA7GD1" was created
And i click in pedidos
And i search the order
Then i validate the data

@searchSomethingWrongInMoip @seach_Moip_sandbox 
Scenario: Search an order with a customer
When i click in acessar sua conta
And i click in pedidos
And i search the order with "CUS-VBVB25KA7GD1"
Then i validate the message 

@searchInHomePageField @seach_Moip_sandbox 
Scenario: Search an order with a customer
When i click in acessar sua conta
And a new order with client "CUS-VBVB25KA7GD1" was created
And i search the order in home page
Then i validate the data