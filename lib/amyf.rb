# frozen_string_literal: true

require 'optparse'
require 'battlestation'

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
      opts.on('-h', '--help', 'I need somebody (not just anybody)') do
        puts opts
        exit
      end
    end.parse!

    Battlestation.new.setup if options[:battleship] == true
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
