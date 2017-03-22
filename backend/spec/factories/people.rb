# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  given_name  :string
#  family_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :person do
    # The second one represents a middle name; faker doesn't have something for that
    given_name { "#{Faker::Name.first_name} #{Faker::Name.first_name}" }
    family_name { Faker::Name.last_name }
  end
end
