namespace :db do
  desc "Make topics"
  task populate: :environment do
  	Topic.create!(name: "COSC 111", topic_id: 0)
  	Topic.create!(name: "Matt is the best", topic_id: 0)
  end
end