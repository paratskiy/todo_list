require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { FactoryBot.create :project }

  def build_custom_entity(subject, **params)
    FactoryBot.build(subject, params)
  end

  context 'correct project' do
    it 'should be valid' do
      expect(project).to be_valid
    end
  end

  context 'with empty data' do
    it 'user id should be present' do
      expect(build_custom_entity(:project, user_id: nil)).not_to be_valid
    end

    it 'name should be present' do
      project.name = ' '
      expect(project).not_to be_valid
    end
  end
end
