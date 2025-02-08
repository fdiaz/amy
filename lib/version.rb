# frozen_string_literal: true

Version = Struct.new(:major, :minor, :patch, :prerelease_name, :prerelease_version) do
  def to_s
    return "#{major}.#{minor}.#{patch}-#{prerelease_name}.#{prerelease_version}" if prerelease_name && prerelease_version
    return "#{major}.#{minor}.#{patch}-#{prerelease_name}" if prerelease_name && !prerelease_version
    return "#{major}.#{minor}.#{patch}" if patch
    return "#{major}.#{minor}" if minor

    major.to_s
  end

  def bump_major
    Version.new(major + 1, 0, 0, prerelease_name, nil)
  end

  def bump_minor
    Version.new(major, minor + 1, 0, prerelease_name, nil)
  end

  def bump_patch
    Version.new(major, minor, patch + 1, prerelease_name, nil)
  end

  def bump_prerelease
    Version.new(major, minor, patch, prerelease_name, prerelease_version ? prerelease_version + 1 : 1)
  end
end
