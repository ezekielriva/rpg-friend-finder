class GamesController < ApplicationController
  before_filter :set_game,  only: [:edit, :update, :destroy, :show]
  before_filter :set_title, only: [:edit, :show]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def update
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      return redirect_to games_path,
                         notice: "The game has been created successfully"
    end

    render :new
  end

  def destroy
  end

  def show
    @game = @game.decorate
  end

  private

  def game_params
    params.require(:game).permit(:name, :wikipedia_link, :webpage)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def set_title
    @title = @game.decorate
  end
end
