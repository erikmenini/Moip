<h1>Arquitetura do projeto</h1>

Configurando sua máquina
-------------------------
Necessário instalar:
-----------------------

*	Ruby: linguagem de programação utilizada nos testes.
*	Para instalação no MAC acesse: <https://gorails.com/setup/osx/10.13-high-sierra>
*   Para instalação no Ubunto acesse: <https://gorails.com/setup/ubuntu/18.10>
*   Para instalação no Windows siga abaixo:

Obs: A instalção do MAC e Ubunto é bem simples de realizar, por isso irei inserir o referente ao windows que requer mais atenção

Configurando o ambiente de automação de testes Web
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
--------

<h3>1. Instalando o Console do Cmder</h3>

*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder.zip> .
*	Descompactar na pasta C:\Cmder.
*	Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho.
*	Executar o cmder.exe.

<h3>2. Instalando o Ruby para Windows de acordo com a versão do seu sistema operacional e arquitetura x86 (32bits) ou x64 (64bits)</h3>

*	Baixe em: <http://rubyinstaller.org/downloads/>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
* 	Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
*	No Console do Cmder, digite o comando ruby –v , se a instalação estiver correta aparecerá a versão instalada.

<h3>3. Instalando Devkit</h3>	

*	Baixe em (x86): <https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe>.
* 	Baixe em (x64): <http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe>.
*	Acesse o diretório C:\Ruby23-x64.
*	Crie uma pasta chamada devkit e coloque o arquivo baixado dentro dessa pasta.
*	Clique duas vezes no arquivo para que ele descompate os arquivos na pasta que foi criada.
*	No Console do Cmder, digite os comandos:

```bash
cd/
cd C:\Ruby23-x64\devkit
ruby dk.rb init
ruby dk.rb install
```

<h3>4. Alterando os sources do rubygems</h3>

O Rubygems precisa de uma atualização de certificado de sergurança para permitir utilizar com https,
e para não precisar atualizar isso, passamos a utilizar então o repositório de gems em http, fazendo o
seguinte:
*	No Console do Cmder, digite o comando:
```bash
gem sources -a http://rubygems.org/
gem sources -r https://rubygems.org/
```

<h3>5. Instalando o bundler</h3>

No Console do Cmder, digite o comando:
```bash
gem install bundler
```

<h3>6. Instalando o chromedriver, IEdriver e Geckodriver</h3>

Baixe o chromedriver em: <https://sites.google.com/a/chromium.org/chromedriver/downloads> .
*	Descompacte o arquivo dentro da pasta C:\Ruby23-x64\bin.

Faça o mesmo para o IEdriver e o Geckodriver.

E pronto, ambiente configurado.

Clonando o repositório do git para execução dos teste
------------------------------------------------------

<h3>Selecionando o destino para o clone do projeto</h3>

*	Navegue no Cmder até a pasta em que você achar mais apropriada para ser feito o clone do projeto, como exemplo vou utilizar a pasta Moip dentro do C:.
```bash
cd/
cd Moip
```

<h3>Clonando o repositório </h3>

*	No Console do Cmder, digite o comando:

````bash
git clone https://github.com/erikmenini/Moip.git

````
Como é possível ver, a estrutura do comando é "git clone [endereço do repositório] .

Feito isso, temos um clone do projeto para que possamos trabalhar e executar os testes automatizados.


Automação de Testes
--------------------
<h3> Automação WEB e REST</h3>
*   Esta automação possui testes WEB, das quais são:
WEB:
*   login.feature
*   search_Moip_sandbox.feaure

REST:
*   authentication_api.feature
*   client.feature
*   orders.feature
*   payments.feature

<h3> Utilizando o env.rb</h3>

*	O env.rb inicializa configurações do teste, tal como o navegador que deve ser utilizado.
*	O require sob em memória os arquivos das Gems necessárias.


<h3>Gem Faker</h3> 

O Faker é um gem do Ruby que gera dados aleatórios (“fakes”) para diversos tipos de necessidades, como por exemplo:
*	Nome
*	Sobrenome
*	Cidade
*	Estado
*	Telefone

Para maiores informações <https://github.com/stympy/faker>

<h3>Hooks.rb</h3>

O termo hook do inglês significa gancho. E trazendo para o nosso contexto de automação, o arquivo hooks.rb é quem armazena todo o código que fará uma ação em momentos que serão estabelecidos através deste arquivo.
Dois momentos que pode ser utilizado é:

*	Antes da nossa automação iniciar a execução, que é o período antes de um cenário de teste iniciar a execução.
*	E após o termino da execução de um cenário, período após finalizar um cenário de teste.

O Ruby entende estes momentos quando utilizamos as seguintes palavras chaves:

*	Before
*	After


<h3>Tags</h3>

Utilizaremos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha de cima do nome do cenário.
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

cucumber –-tag @nome_da_tag
Ou 
cucumber –t @nome_da_tag

Esse comando rodará todos os cenários que tiverem a tag.

Executando os testes automatizados
-----------------------------------
Para executar o testes automatizados usaremos alguns comandos a partir da pasta raiz do projeto.

Antes de inciar a execução dos testes é necessário instalar todas as gems que precisaremos. Para isso basta abrir o terminal ou o cmder na raíz do projeto e executar:

````bash
bundle install
````

Com este comando todas as gems necessárias serão instaladas.


*	Para execução de todos os cenários implementados com o navegador chrome padrão utilizamos o seguinte código:
````bash
cucumber
````
Todos os testes são executados

*	Para execução de algum cenário específico utilizamos as tags:
````bash
cucumber -t @loginsucessfull
````
O teste demarcado com a tag é executado.

As tags para execução de uma suíte:

* Para executar todos:
````bash
cucumber
````

* Para executar suítes separadas:

````bash
cucumber –-tag @login 
cucumber --tag @auth
cucumber --tag @client
cucumber --tag @orders
cucumber --tag @payment
cucumber --tag @seach_Moip_sandbox
````

Contato
-------
*	E-mail: erikmenini@gmail.com
*	Linkedin: <https://www.linkedin.com/in/erik-menini-arimath%C3%A9a-3a380b30/>











