# Automatização de API do tipo Restful

Curso da QALizando
https://www.youtube.com/playlist?list=PL0nYAInGtru2rRzyZqUB4xxxJE23LKb1g do Antonio Lima (https://www.linkedin.com/in/antonio-lima-qalizando/)


# Framework e Ferramentas

HTTParty
Cucumber
RSPec
Ruby
Git
Postman

# Documentação
Documentação:

Httparty: https://www.rubydoc.info/github/jnunemaker/httparty

Cucumber: https://cucumber.io/docs/cucumber/

RSpec: https://rspec.info/documentation/

Gem Faker: https://github.com/faker-ruby/faker


# 1 passo

criar o arquivo Gemfile com todas as bibliotecas que serão utilizadas
Depois para instalar todas as gems listadas, rodar o comando: bundler install 

para consultar todas as gems: gem list

# 2 passo

cucumber --init
Para iniciar o projeto e pastas serem criadas automaticamente

vá na pasta features > support > env.rb, e faça os requires para as gems

# 3 passo

https://dummy.restapiexample.com/api/v1/employees
Dummy API, api fake
de gestão de funcionários de uma empresa

Get = https://dummy.restapiexample.com/api/v1/employees
pega todos os funcioários da base

Post = https://dummy.restapiexample.com/api/v1/create
cadastra um funcionário na base, precisa enviar o body da requisição através do JSON

{
    "id": 25,
    "employee_name": "Pechugon",
    "employee_salary": 320800,
    "employee_age": 35,
    "profile_image": ""
}

c
onde o número final é o ID de um funcionário cadastrado
método usado para alterar alguma informação de funcionário já presente na base.

{
    "id": 9907,
    "employee_name": "Josue",
    "employee_salary": 320800,
    "employee_age": 35,
    "profile_image": ""
}

Delete = https://dummy.restapiexample.com/api/v1/delete/9907
onde o número final é o ID de um funcionário cadastrado pra ser deletado

# 4 passo GET

a escrita em guerkin deve ser algo genérico, pois diferente do teste de front, aqui na api não pensamos nas telas, então por exemplo o guerkin do GET seria: 

 Funcionalidade: Pesquisar funcionários
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informações dos funcionários

    Cenario: Buscar informações de funcionário
        Dado que o usuário consulte informações de funcionário
        Quando ele realizar a pesquisa 
        Então uma lista de funcionários deve retornar

AO final, abra o terminal e escreva: cucumber
com isso vai gerar as chaves que iremos colar em features > step_definitions > get.rb
As chaves é o que aparece depois da linha: "You can implement step definitions for undefined steps with these snippets:"

É algo por exemplo assim:
Dado('que o usuário consulte informações de funcionário') do
     @teste = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees') #armazenamos a url na variavel teste
    puts @teste
  end
  
  Quando('ele realizar a pesquisa') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('uma lista de funcionários deve retornar') do
    pending # Write code here that turns the phrase above into concrete actions
  end

Ao final abra o terminal e rode o comando: cucumber, ele retornara tudo.

# 5 passo POST

Para o post, crie o guerkin, e em cima agregue a tag @cenario_dois
abra o terminal e rode: cucumber -t @cenario_dois
gerará as chaves automaticas:

You can implement step definitions for undefined steps with these snippets:

Dado('que o usuario cadastre um novo funcionario') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('ele enviar as informacoes do funcionario') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('esse funcionario sera cadastrado') do
  pending # Write code here that turns the phrase above into concrete actions
end

Copie e cole para o arquivo de steps

Depois de atualizar, acrescente um puts "@create_employee", verifique a resposta:
{"status":"success","data":{"{\"id\":25,\"employee_name\":\"Pechugon\",\"employee_salary\":320800,\"employee_age\":35,\"profile_image\":\"\"}":null,"id":2268},"message":"Successfully! Record has been added."}

# 6 passo PUT
Para o put, crie o guerkin, e em cima agregue a tag @cenario_tres
abra o terminal e rode: cucumber -t @cenario_tres
gerará as chaves automaticas:

You can implement step definitions for undefined steps with these snippets:

Dado('que o usuario altere uma informacao de funcionario') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('ele enviar as novas informacoes') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('as informacoes serao alteradas') do
  pending # Write code here that turns the phrase above into concrete actions
end

# 7 Passo Delete
Para o delete, crie o guerkin, e em cima agregue a tag @cenario_quatro
abra o terminal e rode: cucumber -t @cenario_tres
gerará as chaves automaticas:

You can implement step definitions for undefined steps with these snippets:

Dado('que o usuario queira deletar um funcionario') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('ele enviar a identificacao unica') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('esse funcionario sera deletado do sistema') do
  pending # Write code here that turns the phrase above into concrete actions
end# Testes-Back-End-Com-HTTParty-Cucumber
