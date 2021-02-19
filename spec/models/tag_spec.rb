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
require 'rails_helper'

RSpec.describe Tag, type: :model do

  it 'userなしで作成できない' do
    tag = Tag.new(
      name: "hogehoge"
    )

    expect(tag).to be_invalid
  end

  it 'weights, weight_tagsなしで作成できる' do
    user = User.create(
      email: 'hogehoge@hoge.com',
      name: 'hogehoge',
      password: 'hoge'
    )

    tag = Tag.new(
      name: "fugafuga",
      user_id: user.id
    )

    expect(tag).to be_valid
  end
end
