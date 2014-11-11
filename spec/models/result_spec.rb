require 'spec_helper'

describe Result do
  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :game }

  it { expect(subject).to validate_presence_of(:round_one) }
  it { expect(subject).to validate_presence_of(:round_two) }
  it { expect(subject).to validate_presence_of(:round_three) }
  it { expect(subject).to validate_presence_of(:round_four) }
  it { expect(subject).to validate_presence_of(:total_score) }
  it { expect(subject).to validate_presence_of(:team_id) }
  it { expect(subject).to validate_presence_of(:game_id) }

  describe 'with callbacks' do
    let(:team)   { FactoryGirl.create(:team) }
    let(:result) { FactoryGirl.create(:result, team: team) }

    it 'updates team after create' do
      expect{ result }.to change{ team.reload.total_score }.by(subject.total_score)
    end
  end

end
