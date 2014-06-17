FactoryGirl.define do
  sequence :lat do |n|
    "#{n}.0".to_f
  end

  sequence :lon do |n|
    "#{n}.0".to_f
  end

  sequence :name do |n|
    "name #{n}"
  end

  sequence :started_at do |n|
    Time.zone.now + n.hours
  end

  sequence :facebook_id do |n|
    "id #{n}"
  end

  factory :event do
    lat
    lon
    name
    started_at
    owner factory: :user
  end

  factory :user do
    facebook_id
    first_name :name
    last_name :name
    image_url :url
  end
end
