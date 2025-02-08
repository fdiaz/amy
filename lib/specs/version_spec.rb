# frozen_string_literal: true

require 'rspec'
require_relative '../version'

RSpec.describe Version do
  describe '#to_s' do
    it 'converts a simple version without prerelease info' do
      version = described_class.new(1, 2, 3)
      expect(version.to_s).to eq('1.2.3')
    end

    it 'handles a pre-release without a numeric prerelease version' do
      version = described_class.new(2, 3, 4, 'rc')
      expect(version.to_s).to eq('2.3.4-rc')
    end

    it 'handles a complex pre-release version' do
      version = described_class.new(1, 0, 0, 'alpha', 42)
      expect(version.to_s).to eq('1.0.0-alpha.42')
    end

    it 'handles a version with zero values correctly' do
      version = described_class.new(0, 0, 1)
      expect(version.to_s).to eq('0.0.1')
    end

    it 'handles a version with large numbers correctly' do
      version = described_class.new(10, 99, 100)
      expect(version.to_s).to eq('10.99.100')
    end

    it 'handles a version with no patch correctly' do
      version = described_class.new(10, 99)
      expect(version.to_s).to eq('10.99')
    end

    it 'handles a version with no minor correctly' do
      version = described_class.new(30)
      expect(version.to_s).to eq('30')
    end
  end

  describe '#bump_minor' do
    it 'increments the minor version by 1' do
      version = described_class.new(1, 2, 3).bump_minor
      expect(version.to_h).to eq described_class.new(1, 3, 0).to_h
    end

    it 'handles single-digit minor versions correctly' do
      version = described_class.new(2, 0, 5).bump_minor
      expect(version.to_h).to eq described_class.new(2, 1, 0).to_h
    end

    it 'handles larger minor numbers correctly' do
      version = described_class.new(5, 99, 10).bump_minor
      expect(version.to_h).to eq described_class.new(5, 100, 0).to_h
    end

    it 'works with prerelease version' do
      version = described_class.new(5, 99, 10, 'beta', 2).bump_minor
      expect(version.to_h).to eq described_class.new(5, 100, 0, 'beta', nil).to_h
    end
  end

  describe '#bump_prerelease' do
    it 'bumps a prerelease with no version' do
      version = described_class.new(1, 2, 3, 'beta', nil).bump_prerelease
      expect(version.to_h).to eq described_class.new(1, 2, 3, 'beta', 1).to_h
    end
  end
end
