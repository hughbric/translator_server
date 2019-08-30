FactoryBot.define do
  factory :random_term, class: Term do
    term { Faker::Creature::Animal.name }
    pig_latin { Faker::Creature::Animal.name }
  end
end
