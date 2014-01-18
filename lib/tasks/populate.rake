namespace :db do
  desc "Make topics"
  task populate: :environment do
  	Topic.create!(name: "COSC 111", topic_id: 0)
  	Topic.create!(name: "Matt is the best", topic_id: 0)
  	User.create!(fname: "Matt", lname: "Bojey", email: "test@test.ca", username: "test", 
  		password: "testtest", password_confirmation: "testtest", lab: "L05",
  		studentnumber: "0", user_id: 0)
  	User.create!(fname: "Matt", lname: "Bojey", email: "test2@test.ca", username: "tatest", 
  		password: "testtest", password_confirmation: "testtest", lab: "L05",
  		studentnumber: "0", user_id: 0, assistant: true)
  	User.create!(fname: "Matt", lname: "Bojey", email: "test3@test.ca", username: "proftest", 
  		password: "testtest", password_confirmation: "testtest", lab: "L05",
  		studentnumber: "0", user_id: 0, instructor: true)
    Question.create(qtext:"This is the question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now, 
      lab: "L05", grade: "Review Pending", fname: "Matt", lname: "Bojey", studentnumber: 0 )
    Question.create(qtext:"This is the second question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now, 
      lab: "L05", grade: "Review Pending", fname: "Matt", lname: "Cojey", studentnumber: 1 )
    Question.create(qtext:"This is the third question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now,
       lab: "L05", grade: "Review Pending", fname: "Matt", lname: "Bojey", studentnumber: 0 )
    Question.create(qtext:"This is the fourth question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now,
       lab: "L05", grade: "Review Pending", fname: "Matt", lname: "Dojey", studentnumber: 2 )
    Question.create(qtext:"This is the fifth question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now,
       lab: "L05", grade: "Review Pending", fname: "att", lname: "Bojey", studentnumber: 3)
    Question.create(qtext:"This is the sixth question text", a1text: "Wrong", a2text: "Wrong", a3text: "Wrong",
      a4text: "Correct", a5text: "Wrong", answer: 4, user_id: 1, topic_id: 1, submitted: true, date_submitted: DateTime.now,
       lab: "L05", grade: "Review Pending", fname: "att", lname: "ojey", studentnumber: 4 )

  end
end