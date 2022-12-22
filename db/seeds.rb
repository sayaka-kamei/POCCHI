# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.create!(
  name: "サザエ",
  gender: "女性",
  age: "1980",
  email: "sazae@sazaesan.com",
  password: "password",
  admin: true
)

@user2 = User.create!(
  name: "タラオ",
  gender: "男性",
  age: "2002",
  email: "tarao@sazaesan.com",
  password: "password",
  admin: false
)

@user3 = User.create!(
  name: 'ふね',
  gender: '女性',
  age: '1962',
  email: 'hune@sazaesan.com',
  password: 'password',
  admin: false
)

@user4 = User.create!(
  name: '波平',
  gender: '男性',
  age: '1962',
  email: 'namihei@sazaesan.com',
  password: 'password',
  admin: false
)

@user5 = User.create!(
  name: 'マスオ',
  gender: '男性',
  age: '1972',
  email: 'masuo@sazaesan.com',
  password: 'password',
  admin: false
)

@user6 = User.create!(
  name: 'ワカメ',
  gender: '女性',
  age: '1995',
  email: 'wakame@sazaesan.com',
  password: 'password',
  admin: false
)

@user7 = User.create!(
  name: 'カツオ',
  gender: '男性',
  age: '1990',
  email: 'katsuo@sazaesan.com',
  password: 'password',
  admin: false
)

@group1 = Group.create!(
  name: 'フグ田家'
)

@group2 = Group.create!(
  name: '磯野家'
)

Assign.create!(
  user_id: @user1.id,
  group_id: @group1.id
)

Assign.create!(
  user_id: @user2.id,
  group_id: @group1.id
)

Assign.create!(
  user_id: @user3.id,
  group_id: @group2.id
)

Assign.create!(
  user_id: @user4.id,
  group_id: @group2.id
)

Assign.create!(
  user_id: @user5.id,
  group_id: @group1.id
)

Assign.create!(
  user_id: @user6.id,
  group_id: @group2.id
)

Assign.create!(
  user_id: @user7.id,
  group_id: @group2.id
)

Assign.create!(
  user_id: @user1.id,
  group_id: @group2.id
)

@quiz = Quiz.create!(
  title: "元気ですか〜？",
  image: File.open("./app/assets/images/quiz.png"),
  request_answer_on: Date.current
)

Answer.create!(
  user_id: @user1.id,
  select_answer: "A",
  group_id: @group1.id,
  quiz_id: @quiz.id,
)  

Answer.create!(
  user_id: @user2.id,
  select_answer: "B",
  group_id: @group1.id,
  quiz_id: @quiz.id,
)  

Answer.create!(
  user_id: @user3.id,
  select_answer: "A",
  group_id: @group2.id,
  quiz_id: @quiz.id,
)  

Answer.create!(
  user_id: @user4.id,
  select_answer: "B",
  group_id: @group2.id,
  quiz_id: @quiz.id,
)  

Answer.create!(
  user_id: @user5.id,
  select_answer: "C",
  group_id: @group1.id,
  quiz_id: @quiz.id,
)  

