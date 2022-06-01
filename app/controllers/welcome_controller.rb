class WelcomeController < ApplicationController
  def index
    cookies[:aula] = "Aula de ruby on Rails - Carlos Santos [COOKIES]"
    session[:curso] = "Curso de ruby on Rails - Carlos Santos [Session]"

    @nome = params[:nome]
  end
end
