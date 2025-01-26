# frozen_string_literal: true

require 'optparse'
require 'battlestation'

# Stops to smells the roses
module Amy
  # rubocop:disable Metrics/MethodLength
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

    return unless options[:battleship] == true

    Battlestation.new.setup
  end
  # rubocop:enable Metrics/MethodLength
  
  def cat_art
    <<~CAT
       /\_/\
      ( o.o )    Hi.
       > ^ <    
    CAT
  end
end
