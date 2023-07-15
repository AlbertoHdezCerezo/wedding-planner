FactoryBot.define do
  factory :wedding do
    date { Date.today + rand(1..365).days }
    sequence :description do
      "Description for wedding #{_1}"
    end
  end
end
