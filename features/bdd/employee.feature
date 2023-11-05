#language:pt
Funcionalidade: Pesquisar funcionários
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informações dos funcionários

    @cenario_hum 
    Cenario: Buscar informações de funcionário
        Dado que o usuário consulte informações de funcionário
        Quando ele realizar a pesquisa 
        Então uma lista de funcionários deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionário
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Então esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Alterar informacoes cadastrais
        Dado que o usuario altere uma informacao de funcionario
        Quando ele enviar as novas informacoes
        Então as informacoes serao alteradas
    
    @cenario_quatro
    Cenario: Deletar cadastro de funcionario
        Dado que o usuario queira deletar um funcionario
        Quando ele enviar a identificacao unica
        Então esse funcionario sera deletado do sistema




