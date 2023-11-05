#GET
Dado('que o usuário consulte informações de funcionário') do
    @getlist = Employee_Requests.new #armazenamos a url na variavel, depois colocamos só o path /employees, agora com a classe em employee_request chamamos a classe diretamente
  end
  
  Quando('ele realizar a pesquisa') do
    @list_employee = @getlist.find_employee #variavel para  recuperar o response depois,com o modulo Employees, depois trocamos pela classe, usando o metodo find_employess criado lá
  end
  
  Então('uma lista de funcionários deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
  end

#POST
Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new #inicializo as classes
    @assert = Assertions.new
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name][:name6], DATABASE[:salary][:salary6], DATABASE[:age][:age6])
    puts @create_employee
  end
  
  Então('esse funcionario sera cadastrado') do
    @assert.request_success(@create_employee.code, @create_employee.message)
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee["data"]["employee_name"]).to eql DATABASE[:name][:name6]
    expect(@create_employee["data"]["employee_salary"]).to eql DATABASE[:salary][:salary6]
    expect(@create_employee["data"]["employee_age"]).to eql DATABASE[:age][:age6]
  end

  #PUT
  Dado('que o usuario altere uma informacao de funcionario') do
    @request = Employee_Requests.new #reaproveita a mesma classe, inicializa, e salva em uma variável
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Alberto', 100, 40)
    puts @update_employee
  end
  
  Então('as informacoes serao alteradas') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.msg).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee["data"]["employee_name"]).to eql 'Alberto'
    expect(@update_employee["data"]["employee_salary"]).to eql (100)
    expect(@update_employee["data"]["employee_age"]).to eql (40)
  end
  
  #DELETE
Dado('que o usuario queira deletar um funcionario') do
  @request = Employee_Requests.new
end

Quando('ele enviar a identificacao unica') do
  @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
end

Então('esse funcionario sera deletado do sistema') do
  expect(@delete_employee.code).to eql (200)
  expect(@delete_employee.msg).to eql 'OK'
  expect(@delete_employee["status"]).to eql 'success'
  expect(@delete_employee["data"]).to eql '1'
  expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted'
end