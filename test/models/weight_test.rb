# == Schema Information
#
# Table name: weights
#
#  id         :bigint           not null, primary key
#  comment    :string(255)
#  date       :date
#  weight     :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
require 'test_helper'

class WeightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
