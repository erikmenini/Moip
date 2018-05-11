#encoding: utf-8

Feature: API Customers SandBox Moip
As Sandbox Moip admin i want to login in sandbox account

Background:
Given i access the login Page
Given i have the login, password with the data:
    |login                 |password    |
    | erikmenini@gmail.com |ERik12111990|

@loginsucessfull @login 
Scenario: Login sucess
When i click in acessar sua conta
Then i should see "Olá Erik, veja o resumo da sua conta." na home page

@loginfailled @login
Scenario: Login failed
And i click in acessar sua conta
Then a should see "Usuário e/ou senha inválidos"

@logout 
Scenario: Logout
And i click in acessar sua conta
Then i logout
