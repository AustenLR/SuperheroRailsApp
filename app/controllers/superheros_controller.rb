class SuperherosController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]
  before_action :all_teams, only: [:new, :edit]
  def index
    @superheros = Superhero.all
  end

  def new
    if session[:user_id]
      @user = User.find session[:user_id]
      @superhero = Superhero.new
    else 
      redirect_to superheros_path
    end
  end

  def create
    @user = User.find session[:user_id]
    @superhero = @user.superheros.build superhero_params
    @superhero.save
    redirect_to @superhero
  end

  def show
  end

  def edit
    if session[:user_id]
      render :edit
    else
      redirect_to superheros_path
    end
  end

  def update
    @superhero.update superhero_params
    redirect_to @superhero
  end


  def destroy
    if session[:user_id]
      @superhero.destroy
      redirect_to superheros_path
    else 
      redirect_to superheros_path
    end
  end

  private

  def all_teams
    @teams = Team.all
  end

  def set_superhero
    @superhero = Superhero.find params[:id]
  end

  def superhero_params
    params.require(:superhero).permit(:name, team_ids:[])
  end

end
