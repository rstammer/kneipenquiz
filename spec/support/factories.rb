# encoding: UTF-8
FactoryGirl.define do

  factory :game do
    title 'A new game'
  end

  factory :category do
    title 'Politik'
  end

  factory :question do
    title 'A simple title'
    content 'Whos gonna merge?'
    answer 'Oraclocat'
    typus 'normal'
  end

  factory :user do
    email { "foo#{rand(1900000)}@bar.baz" }
    password '1234565767503242'
  end

  factory :result do
    round_one 1
    round_two 2
    round_three 3
    round_four 4
    total_score 10
    team
    game
  end

  factory :team do
    title 'SV Werder'
  end

end
