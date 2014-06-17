module ResponseJSON
  def response_json
    binding.pry
    # TODO remove this pry (after inspecting the json and understanding this method)
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include ResponseJSON
end
