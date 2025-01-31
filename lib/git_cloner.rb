# frozen_string_literal: true

require 'fileutils'
require 'git'
require 'log'

# Clones git repositories locally
class GitCloner
  # @param base_dir The directory to which the repositories will be copied locally
  def initialize(base_dir = '.')
    @base_dir = base_dir
  end

  # Accepts an array of GitHub repository URLs (either HTTPS or SSH links) and clones
  # them locally if they have not already been cloned.
  #
  # @param repo_urls An array of URLs pointing to GitHub repositories
  def clone_repos(repo_urls)
    repo_urls.each do |url|
      clone_repo(url)
    end
  end

  def clone_repo(url)
    repo_path = extract_repo_path(url)
    local_path = File.join(@base_dir, repo_path)

    if Dir.exist?(local_path)
      Log.info "Repository already exists at #{local_path}. Skipping..."
    else
      Log.info "Cloning #{url} into #{local_path}..."
      FileUtils.mkdir_p(local_path)
      Git.clone(url, local_path)
    end
  end

  def extract_repo_path(url)
    # Extract the username and repository name from the GitHub URL
    # Don't ask me what's in this monstruosity
    match = url.match(%r{github\.com[:/]([^/]+)/([^/]+?)(?:\.git)?$})
    raise "Invalid GitHub URL: #{url}" unless match

    username = match[1]
    repo_name = match[2]
    "#{username}/#{repo_name}"
  end
end
