class Api::V1::Events::NearestsController < ApiController
  def index
    @events = Event.near(
      [params[:lat], params[:lon]],
      params[:radius],
      units: :km
    )

    if @events.present?
      render
    else
      render json: {
        'message' => 'No Events Found'
      }.to_json, code: 200
    end
  end
end
