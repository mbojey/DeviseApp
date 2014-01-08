class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @user = current_user
      @games = Game.where(:user_id => @user.user_id)
      @count = @games.count
      @number = 0
      @percent = 0
      @games.each do |g|
        if !(g.number == 0)
          if((g.correct/g.number)*100) > @percent
            @percent = ((g.correct/g.number)*100)
            @number = g.number
          elsif ((g.correct/g.number)*100) == @percent
            if g.number > @number
              @number = g.number
            end
          end
        end
      end
    end
  end

  def terms
    if user_signed_in?
      @user = current_user
    end
  end
end