RSpec.describe do
  require './8_16_initialize_attribute.rb'

  let!(:user1) { User.create(name: 1, score: 20) }
  let!(:user2) { User.create(name: 2, score: 25) }
  let!(:user3) { User.create(name: 3, score: 40) }
  let!(:user4) { User.create(name: 4, score: 40) }
  let!(:user5) { User.create(name: 5, score: 75) }
  let!(:user6) { User.create(name: 5, score: 100) }
  let(:median_score) { User.pluck(:score).median }
  let(:average_score) { User.pluck(:score).average }

  describe 'rank' do
    # it { expect(user1.rank(median_score, average_score)).to eq :C }
    # it { expect(user2.rank(median_score, average_score)).to eq :C }
    # it { expect(user3.rank(median_score, average_score)).to eq :B }
    # it { expect(user4.rank(median_score, average_score)).to eq :B }
    # it { expect(user5.rank(median_score, average_score)).to eq :A }
    # it { expect(user6.rank(median_score, average_score)).to eq :A }

    # TODO: リファクタリング後は、下記の形式でテストがパスするようにしてください。
    it { expect(user1.rank).to eq :C }
    it { expect(user2.rank).to eq :C }
    it { expect(user3.rank).to eq :B }
    it { expect(user4.rank).to eq :B }
    it { expect(user5.rank).to eq :A }
    it { expect(user5.rank).to eq :A }
  end

  describe 'failed?' do
    # it { expect(user1.failed?(median_score, average_score)).to be true }
    # it { expect(user2.failed?(median_score, average_score)).to be false }
    # it { expect(user3.failed?(median_score, average_score)).to be false }
    # it { expect(user4.failed?(median_score, average_score)).to be false }
    # it { expect(user5.failed?(median_score, average_score)).to be false }
    # it { expect(user6.failed?(median_score, average_score)).to be false }

    # TODO: リファクタリング後は、下記の形式でテストがパスするようにしてください。
    it { expect(user1.failed?).to be true }
    it { expect(user2.failed?).to be false }
    it { expect(user3.failed?).to be false }
    it { expect(user4.failed?).to be false }
    it { expect(user5.failed?).to be false }
    it { expect(user6.failed?).to be false }
  end
end

