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
  belongs_to :tag, dependent: :destroy
  belongs_to :weight, dependent: :destroy

  validates :weight_id, presence: true
  validates :tag_id, presence: true
end
