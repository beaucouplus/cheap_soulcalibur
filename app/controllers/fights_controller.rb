class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save

        format.html { redirect_to @fight, notice: 'Begin !' }
        format.json { render :show, status: :created, location: @fight }
      else
        format.html { render :new }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  def play
    @fight = Fight.find(params[:id])
    @game = Game.new(@fight, session[:game_status])
    current = CurrentPlayer.new(@fight,params[:player])
    @hit = Play.new(@game,current).hit_opponent
    @status = session[:game_status] = @game.status
    # p @status
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def index
    @fights = Fight.all
  end

  def show
    @fight = Fight.find(params[:id])
    session[:game_status] = { first_player_life: @fight.first_player.life_points,
                              second_player_life: @fight.second_player.life_points,
                              summary: [] }
  end

  private
  def fight_params
    params.require(:fight).permit(:player_1, :player_2)
  end
end
