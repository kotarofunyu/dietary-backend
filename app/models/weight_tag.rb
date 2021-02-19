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
class WeightTag < ApplicationRecord
end
