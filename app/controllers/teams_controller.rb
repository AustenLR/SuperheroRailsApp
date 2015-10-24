class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :all_heros, only: [:new, :edit]

  def index
    @teams = Team.all
  end

  def new
    if session[:is_admin]
      @user = User.find session[:user_id]
      @team = Team.new
    else 
      redirect_to teams_path
    end
  end

  def create
    @user = User.find session[:user_id]
    @team = @user.teams.build team_params
    @team.save
    redirect_to @team
  end

  def edit
    if session[:is_admin]
      render :edit 
    else
      redirect_to @team
    end
  end

  def update
    @team.update team_params
    redirect_to @team
  end

  def show
  end

  def destroy
    if session[:is_admin]
      @team.destroy
      redirect_to teams_path
    else
      redirect_to @team
    end
  end

  private

  def set_team
    @team = Team.find params[:id]
  end

  def team_params
    params.require(:team).permit(:name, superhero_ids:[])
  end

  def all_heros
    @superheros = Superhero.all 
  end

end
