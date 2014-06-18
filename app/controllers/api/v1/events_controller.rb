class Api::V1::EventsController < ApiController

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @event.errors.full_messages
      }, status: 422
    end
  end

  private

  def event_params
    params.permit(:address, :ended_at, :lat, :lon, :name, :started_at)
      .merge(owner: user)
  end

  def user
    User.find_or_create_by(device_token: device_token)
  end

  def device_token
    params[:owner].try(:[], :device_token)
  end
end
