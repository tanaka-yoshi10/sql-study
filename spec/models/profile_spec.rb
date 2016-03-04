require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'association' do
    example do
      taro = Profile.create! name: '太郎'
      hanako = Profile.create! name: '花子'

      orange = Food.create! name: 'orange'
      lemon = Food.create! name: 'lemon'
      melon = Food.create! name: 'melon'

      taro.liking_foods << orange
      taro.liking_foods << lemon
      taro.disliking_foods << melon

      hanako.liking_foods << melon
      hanako.disliking_foods << orange

      taro.reload
      expect(taro.liking_foods.order(:id)).to eq [orange, lemon]
      expect(taro.disliking_foods.order(:id)).to eq [melon]

      hanako.reload
      expect(hanako.liking_foods.order(:id)).to eq [melon]
      expect(hanako.disliking_foods.order(:id)).to eq [orange]
    end
  end
end
