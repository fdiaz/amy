# frozen_string_literal: true

require 'rspec'
require_relative '../version_parser'

RSpec.describe VersionParser do
  subject(:parser) { described_class }

  let(:dummy_class) { Class.new { include VersionParser } }

  describe '#prerelease_version' do
    it 'with major, minor, patch - it returns nil for prerelease name and version' do
      result = parser.parse('1.2.3')
      expect(result).to eq VersionParser::Version.new(1, 2, 3, nil, nil)
    end

    it 'with major, minor, patch, prerelease and no prerelease version - it assigns it a 0' do
      result = parser.parse('99.2.3-beta')
      expect(result).to eq VersionParser::Version.new(99, 2, 3, 'beta', 0)
    end

    it "with major, minor, patch, prerelease and prerelease version'" do
      result = parser.parse('1.02.3-alpha.238')
      expect(result).to eq VersionParser::Version.new(1, 2, 3, 'alpha', 238)
    end

    it 'with no patch version - it assign it a 0' do
      result = parser.parse('1.2-rc')
      expect(result).to eq VersionParser::Version.new(1, 2, 0, 'rc', 0)
    end

    it 'with no minor version - it assigns 0 to minor and patch' do
      result = parser.parse('874-random')
      expect(result).to eq VersionParser::Version.new(874, 0, 0, 'random', 0)
    end
  end
end
