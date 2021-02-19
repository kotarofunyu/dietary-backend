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
class Weight < ApplicationRecord
  belongs_to :user
  # 入力必須 && 同一日付のデータは一意
  validates :date, presence: true, uniqueness: true
  has_many :weight_tags
  has_many :tags, through: :weight_tags
end
