class Seed
  def self.start
    seed.generate_users
  end

  def generate_users
    1000.times do |i|
      user = User.create!(
            first_name: Faker::Zelda.character,
            last_name: Faker::Zelda.character,
            email: Faker::Internet.email)
      puts "User #{i}: #{user.name} - #{user.email} created!"
    end
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.integer "status", default: 0
    t.integer "role"
    t.string "verification_code"
  end
