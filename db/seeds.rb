class Seed
  def self.start
    seed = Seed.new
    seed.generate_admin
    seed.generate_users
    seed.generate_vendors
    seed.generate_cities
    seed.generate_trips
  end

  def generate_admin
    return if User.where(role: 2).count >= 1

    user = User.create!(
      first_name: "Admin",
      last_name: "Soverign",
      email: "admin@admin.com",
      phone: ENV['phone'],
      password: "password",
      role: 2,
      verification_code: nil,
      )
    puts "Admin created"
  end

  def generate_vendors
    return if User.where(role: 1).count >= 20

    20.times do |i|
      user = User.create!(
            first_name: Faker::Zelda.character,
            last_name: Faker::Zelda.character,
            email: Faker::Internet.email,
            phone: ENV['phone'],
            password: "password",
            role: 1,
            verification_code: nil,
            )
      puts "Vendor #{i}: #{user.first_name} created!"
      6.times do |i|
        tour = Tour.create!(
          name: "#{rand(2..14)} Days in #{Faker::StarTrek.location}",
          description: Faker::TwinPeaks.quote,
          price: "$#{Faker::Number.decimal(2)}",
          average_rating: rand(1..5).to_f,
          user_id: user.id
        )
      end
    end
  end

  def generate_users
    return if User.count >= 1000

    1000.times do |i|
      user = User.create!(
            first_name: Faker::Zelda.character,
            last_name: Faker::Zelda.character,
            email: Faker::Internet.email,
            phone: ENV['phone'],
            password: "password",
            role: 0,
            verification_code: nil,
            )
      puts "User #{i}: #{user.first_name} created!"
    end
  end

  def generate_trips
    return if Trip.count >= 2000

    2000.times do |i|
      user = User.find(Random.new.rand(1..1000))
      city = City.all.sample
      trip = user.trips.create!(
            start_date: "2017-11-17",
            end_date: "2017-11-18",
            start_city: city.name,
            city: city
      )
      add_trips(user, trip)
      puts "Trip #{i}: Trip for #{user.first_name} created!"
    end
  end

  def generate_cities
    City.create(
      place_id: "ChIJzxcfI6qAa4cR1jaKJ_j0jhE",
      name: "Denver",
      country: "United States",
      lat: 39.7392,
      lng: -104.9903,
      picture: "https://res.cloudinary.com/simpleview/image/upload/c_fill,f_auto,h_645,q_50,w_1024/v1/clients/denver/denver_skyline_sunrise_74e8feaa_b49a_4b25_9720_c835907530a9_ca5bc80d-6503-4f77-8220-5520ee2bdac2.jpg"
    )
    City.create(
      place_id: "ChIJdd4hrwug2EcRmSrV3Vo6llI",
      name: "London",
      country: "United Kingdom",
      lat: 51.5074,
      lng: 0.1278,
      picture: "https://media.timeout.com/images/103042848/image.jpg"
    )
    City.create(
      place_id: "ChIJD7fiBh9u5kcRYJSMaMOCCwQ",
      name: "Paris",
      country: "France",
      lat: 48.8566,
      lng: 2.3522,
      picture: "http://www.parisaddress.com/var/source/district/new/tour_eiffel-paris.jpg"
    )
  end

  private
    def add_trips(user, trip)
      user.trips << trip
      puts "Added trip #{trip.id} to user #{user.id}."
    end
end

Seed.start
