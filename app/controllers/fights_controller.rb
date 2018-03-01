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

  def index
    @fights = Fight.all
  end

  def show
    @fight = Fight.find(params[:id])
  end

  private
  def fight_params
    params.require(:fight).permit(:player_1, :player_2)
  end
end
