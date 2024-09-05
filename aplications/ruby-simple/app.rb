# app.rb

# aplicação genérica do uso de ruby
require 'sinatra'

# Página inicial
get '/' do
  '<h1>Bem-vindo à aplicação web simples!</h1>
   <form action="/submit" method="post">
     Nome: <input type="text" name="name"><br>
     Idade: <input type="text" name="age"><br>
     <input type="submit" value="Enviar">
   </form>'
end

# Rota para receber os dados do formulário
post '/submit' do
  "Olá, #{params[:name]}! Você tem #{params[:age]} anos."
end

# Iniciar o servidor explicitamente na porta 4567 e em 0.0.0.0 (escuta em todas as interfaces de rede)
set :bind, '0.0.0.0'
set :port, 4567