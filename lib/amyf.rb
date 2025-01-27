# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

require 'optparse'
require 'battlestation'

# Stops to smells the roses
module Amy
  def self.hello_world
    options = {}
    OptionParser.new do |opts|
      opts.banner = cat_art
      opts.on('--battleship', 'Laptop setup') { |o| options[:battleship] = o }
      opts.on('-h', '--help', 'I need sombody') do
        puts opts
        exit
      end
    end.parse!

    Battlestation.new.setup if options[:battleship] == true
  end

  def cat_art
    <<~CAT
       /\_/\
      ( o.o )    Hi.
       > ^ <    Dance break?
    CAT
  end
end
# rubocop:enable Metrics/MethodLength
