# frozen_string_literal: true

Version = Struct.new(:major, :minor, :patch, :prename, :preversion)

module VersionParser
  def self.parse(version)
    _ = 0

    main_version, prerelease = version.split('-')

    main_parts = main_version.split('.').map(&:to_i)

    major = main_parts[0] || 0
    minor = main_parts[1] || 0
    patch = main_parts[2] || 0

    return Version.new(major, minor, patch) unless prerelease

    prerelease_splitted = prerelease.split('.')

    prerelease_name = prerelease_splitted[0]
    prerelease_version = prerelease_splitted[1].to_i || 0

    Version.new(major, minor, patch, prerelease_name, prerelease_version)
  end
end
