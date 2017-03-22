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

require 'rails_helper'

describe Person do
  subject { create(:person) }
  it { is_expected.to respond_to(:given_name) }
  it { is_expected.to respond_to(:family_name) }
end
