class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to edit_fight_path(@fight), notice: 'Begin !' }
        format.json { render :show, status: :created, location: edit_fight_path(@fight) }
      else
        format.html { render :new }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @fight = Fight.find(params[:id])
    if @fight.winner
      respond_to do |format|
        format.html { render :show }
      end
    end
    session[:game_status] = { first_player_life: @fight.first_player.life_points,
                              second_player_life: @fight.second_player.life_points,
                              summary: [],
                              winner: 0 }
  end

  def play
    @fight = Fight.find(params[:id])
    battle
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def update
    @fight = Fight.find(params[:id])
    @fight.first_player.update_attribute(:experience, 100)
    @fight.second_player.update_attribute(:experience, 100)

    winner = Player.find(session[:game_status]["winner"])
    summary = session[:game_status]["summary"].join("\n")

    if @fight.update(winner: winner, summary: summary)
      @fight.winner.victories += 1
      @fight.loser.defeats += 1
      respond_to do |format|
        format.html { render :show }
      end
    end
  end




  def index
    @fights = Fight.all
  end

  def show
    @fight = Fight.find(params[:id])
    session[:game_status] = { first_player_life: @fight.first_player.life_points,
                              second_player_life: @fight.second_player.life_points,
                              summary: [],
                              winner: 0 }
  end

  private

  def battle
    @game = Game.new(@fight, session[:game_status], params[:player])
    session[:game_status] = @game.play
  end

  def fight_params
    params.require(:fight).permit(:player_1, :player_2, :winner, :weapon_1, :weapon_2)
  end
end
