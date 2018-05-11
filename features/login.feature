#encoding: utf-8

Feature: API Customers SandBox Moip
As Sandbox Moip admin i want to login in sandbox account

Background:
Given i access the login Page

@loginFailedAndSucessfull @login 
Scenario: Login sucess
Given i have the login, password with the data:
    |login                 |password |
    | abc@gmail.com        |123456789|
And i click in acessar sua conta
Then a should see "Usuário e/ou senha inválidos"
Given i have the login, password with the data:
    |login                 |password    |
    | erikmenini@gmail.com |ERik12111990|
When i click in acessar sua conta
Then i should see "Olá Erik, veja o resumo da sua conta." na home page