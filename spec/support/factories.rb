# encoding: UTF-8
FactoryGirl.define do

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

end
