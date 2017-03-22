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

class Person < ApplicationRecord
end
