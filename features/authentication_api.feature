#encoding: utf-8

Feature: API Authentication SandBox Moip
As Sandbox Moip admin i want to access the API

@authenticationfailed @auth
Scenario: Authentication Failed
Given i try to access the API with user "xxx" and password "123"
And i see the response code 401
Then  i get the validation message '{ "ERROR" : "Token or Key are invalids" }'

@authenticationSucess @auth
Scenario: Authentication Sucess
Given i try to acess the API with the correct credentials
Then i get the code 200
 
