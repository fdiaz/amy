# frozen_string_literal: true

require 'rspec'
require_relative '../git_cloner'

RSpec.describe GitCloner do
  subject(:cloner) { described_class.new }

  describe '#extract_repo_path' do
    it 'with a github URL with https' do
      result = cloner.extract_repo_path('https://github.com/fdiaz/fdiaz.github.io.git')
      expect(result).to eq 'fdiaz/fdiaz.github.io'
    end

    it 'with a github URL with ssh' do
      result = cloner.extract_repo_path('git@github.com:fdiaz/amy.git')
      expect(result).to eq 'fdiaz/amy'
    end
  end
end
