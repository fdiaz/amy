# frozen_string_literal: true

Version = Struct.new(:major, :minor, :patch, :prerelease_name, :prerelease_version) do
  def to_s
    return "#{major}.#{minor}.#{patch}-#{prerelease_name}.#{prerelease_version}" if prerelease_name && prerelease_version
    return "#{major}.#{minor}.#{patch}-#{prerelease_name}" if prerelease_name && !prerelease_version
    return "#{major}.#{minor}.#{patch}" if patch
    return "#{major}.#{minor}" if minor

    major.to_s
  end

  def bump_minor
    Version.new(major, minor + 1, patch, prerelease_name, prerelease_version)
  end
end
