class GameController < ApplicationController

  def try
    if params.has_key?(:user_name) && !params[:user_name].strip.empty?
      cookies[:name]= params[:user_name]
    end

    @name= cookies[:name]

    if cookies[:count] == nil
      cookies[:count] = 1
    end

    cookies[:snumber] = 12
    @guess = params[:guess].to_i

     if @guess == cookies[:snumber]
       @result = "You win"
     elsif @guess < cookies[:snumber]
       @result = "Too low, guess again."
     elsif @guess > cookies[:snumber]
       @result = "Too high, guess again."
     end

     cookies[:count] = cookies[:count].to_i + 1
   end

  def reset
    cookies[:count] = 0
  end




end
