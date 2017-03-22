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
    given_name "MyString"
    family_name "MyString"
  end
end
