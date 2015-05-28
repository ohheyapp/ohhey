class MissedConnectionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :new, :show]

  def index
    @missed_connections = MissedConnection.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @missed_connection = MissedConnection.find(params[:id])
  end

  def new
    @missed_connection = MissedConnection.new()
  end

  def create

    if current_user
      @missed_connection = MissedConnection.new(missed_connection_params.merge(user_id: current_user.id))
    else
      password = Devise.friendly_token[0,20]
      @user = User.create_with(email: params[:missed_connection][:users][:email], password: password, password_confirmation: password).find_or_create_by(email: params[:missed_connection][:users][:email])
      @missed_connection = MissedConnection.new(missed_connection_params.merge(user_id: @user.id))
    end

    if @missed_connection.save
      redirect_to root_path, notice: 'Saved!'
    else
      flash.now[:alert] = 'Could not find that location. Please try again'
      render :new
    end
  end

  private

  def missed_connection_params
    params.require(:missed_connection).permit(:user_id, :title, :body, :latitude, :longitude, :location, :question, :answer)
  end
end
