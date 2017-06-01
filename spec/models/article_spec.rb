# frozen_string_literal: true
require 'rails_helper'

describe Article, type: :model do
  subject { build(:article) }

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end # validations
end
