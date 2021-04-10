class TeamsController < ApplicationController

  before_action :set_team, only: [:edit, :update,:destroy, :shift_wise_user]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :index }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      params[:team][:user_ids] = params[:team][:user_ids].nil? ? [] : params[:team][:user_ids]
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shift
    @teams = Team.all
  end

  def shift_wise_user
    @shifts = @team&.shifts
  end

  def update_shift
    shifts = Shift.update(params[:shift].keys, params[:shift].values)
    shifts.each do |shift|
      TeamMailer.shift_mail({team_name: shift.team.name,user_name: shift.user.fullname,timing: shift.timing, email: "cr_dev@full-cycle.com"}).deliver!
    end
    redirect_to teams_path
  end

  def set_team
    @team = Team.find_by_id(params[:id])
  end
   
   # Never trust parameters from the scary internet, only allow the white list through.
   def team_params
      params.require(:team).permit(:name, :id, user_ids: [])
   end

end