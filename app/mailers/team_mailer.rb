class TeamMailer < ApplicationMailer

  def shift_mail(params = {})
    @team_name = params[:team_name]
    @user_name = params[:user_name]
    @timing = params[:timing]
    mail(to: params[:email], subject: 'Shift Changes')
  end
end
