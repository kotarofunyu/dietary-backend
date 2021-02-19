# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Tag < ApplicationRecord
  has_many :weight_tags
  has_many :weights, through: :weight_tags
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
