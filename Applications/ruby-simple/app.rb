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
   </form>
   <br>
   <a href="/image-page">
     <button>Ir para página de imagem</button>
   </a>'
end

# Rota para receber os dados do formulário
post '/submit' do
  "Olá, #{params[:name]}! Você tem #{params[:age]} anos."
end

# Rota para a página de imagem e texto
get '/image-page' do
  '<h1>Página com Imagem e Texto</h1>
   <img src="https://kinsta.com/wp-content/uploads/2022/10/Docker-Diagram.png" alt="Exemplo de Imagem">
   <p>Este é um exemplo de texto abaixo da imagem.</p>
   <br>
   <a href="/">
     <button>Voltar</button>
   </a>'
end

# Iniciar o servidor explicitamente na porta 4567 e em 0.0.0.0 (escuta em todas as interfaces de rede)
set :bind, '0.0.0.0'
set :port, 4567
