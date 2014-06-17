User.delete_all
Event.delete_all

User.create(device_token: '12345')
Event.create(
  address: '85 2nd Street',
  lat: 37.805,
  lon: -122.40916,
  name: 'Best event EVAH!',
  owner: User.find_by(device_token: '12345'),
  started_at: Time.zone.now
)
