namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_microposts
  end

def make_tips
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.tips.create!(content: content) }
    end
  end
end