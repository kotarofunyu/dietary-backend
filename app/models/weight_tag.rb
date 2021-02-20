# == Schema Information
#
# Table name: weight_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer
#  weight_id  :integer
#
class WeightTag < ApplicationRecord
  belongs_to :tag, dependent: :destroy
  belongs_to :weight, dependent: :destroy

end
