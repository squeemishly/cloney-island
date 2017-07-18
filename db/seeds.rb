class Seed
  def self.start
    seed = Seed.new
    seed.generate_admin
    seed.generate_users
    seed.generate_trips
  end

  def generate_admin
    user = User.create!(
      first_name: "Admin",
      last_name: "Soverign",
      email: "admin@admin.com",
      phone: Faker::PhoneNumber.phone_number,
      password: "password",
      role: 2,
      verification_code: nil,
      )
    puts "Admin created"
  end

  def generate_vendors
    20.times do |i|
      user = User.create!(
            first_name: Faker::Zelda.character,
            last_name: Faker::Zelda.character,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number,
            password: "password",
            role: 1,
            verification_code: nil,
            )
      puts "Vendor #{i}: #{user.first_name} created!"
    end
  end

  def generate_users
    1000.times do |i|
      user = User.create!(
            first_name: Faker::Zelda.character,
            last_name: Faker::Zelda.character,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number,
            password: "password",
            role: 0,
            verification_code: nil,
            )
      puts "User #{i}: #{user.first_name} created!"
    end
  end

  def generate_trips
    2000.times do |i|
      user = User.find(Random.new.rand(1..1000))
      trip = user.trips.create!(
            start_date: "2017-11-17",
            end_date: "2017-11-18",
            start_city: Faker::Address.city,
      )
      add_trips(user, trip)
      puts "Trip #{i}: Trip for #{user.first_name} created!"
    end
  end

  private
    def add_trips(user, trip)
      user.trips << trip
      puts "Added trip #{trip.id} to user #{user.id}."
    end
end

Seed.start
