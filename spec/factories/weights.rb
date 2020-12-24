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
FactoryBot.define do
  factory :weight do
    association :user
    comment { '体重減った' }
    date { '2020-01-01' }
    weight { 90 }
  end
end
