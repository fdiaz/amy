# frozen_string_literal: true

require 'optparse'
require_relative 'battlestation'
require_relative 'roadrunner'

# Stops to smells the roses
module Amy
  # Meditate.
  # Medicate.
  # Meditate.
  def self.meditate
    options = {}
    OptionParser.new do |opts|
      opts.banner = cat_art
      opts.on('--battleship', 'Laptop setup') { |o| options[:battleship] = o }
      opts.on('-r', '--roadrunner URLS', 'Comma-separated list of GitHub repository URLs') do |github_urls|
        options[:github_urls] = github_urls.split(',')
      end
      opts.on('-h', '--help', 'I need somebody (not just anybody)') do
        puts opts
        exit
      end
    end.parse!

    Battlestation.new.setup if options[:battleship] == true
    RoadRunner.new(options[:github_urls]).run if options[:github_urls]
  end

  def self.cat_art
    <<~CAT
      -----------------------
         /\\_/\\
        ( o.o )   dance
         > ^ <      break  ?
      -----------------------
    CAT
  end
end
