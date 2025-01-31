# frozen_string_literal: true

require_relative 'git_cloner'

# Runs around your computer. Does things. Tries to escape the coyote.
class RoadRunner
  # @param github_repos An array of URLs pointing to GitHub repositories
  def initialize(github_repos)
    @github_repos = github_repos
  end

  def run
    GitCloner.new.clone_repos(@github_repos)
  end
end
