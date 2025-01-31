# frozen_string_literal: true

require 'English'
require_relative 'log'

# Responsible of handling all the command line interface logic.
# Inspired by https://github.com/bachand/battlestation
class Battlestation
  # Entry point for the application logic. Here we do the command line arguments processing and
  # inspect the target files.
  #
  # @param args [Array<String>] command line arguments
  # @return [Integer] UNIX exit code
  def setup(_args = ARGV)
    Log.info 'installing homebrew'
    system '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

    Log.info 'installing Rbenv'
    system 'brew install rbenv'
    system 'rbenv init'

    Log.ingo 'installing oh-my-zsh'
    system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

    Log.success(cat_art)

    $CHILD_STATUS.exitstatus
  end

  def self.cat_art
    <<~CAT
      ----------------------------------
         /\\_/\\
        ( o.o )   reopen your terminal
         > ^ <      bai  !
      ----------------------------------
    CAT
  end
end
