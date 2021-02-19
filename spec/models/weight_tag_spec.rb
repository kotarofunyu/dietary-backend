# == Schema Information
#
# Table name: weight_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer          not null
#  weight_id  :integer          not null
#
require 'rails_helper'

RSpec.describe WeightTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
