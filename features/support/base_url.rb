module Employee
    include HTTParty #para poder usar os metodos do httparty
    @token = HTTParty.post("Url Da Api De Token")
    base_uri 'https://dummy.restapiexample.com/api/v1/'
    format :json
    headers 'Content-Type': 'application/json', 'Authorization': 'Bearer ' +@token.parserd_response['Campo Do Response Que Retorna O Token']
end