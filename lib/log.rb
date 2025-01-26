# frozen_string_literal: true

# Sends a message to the terminal
module Log
  # Sends a decorated message to standard output in red
  def self.success(text)
    $stdout.puts "SUCCESS: \e[0;32m#{text}\e[0m"
  end

  # Sends a decorated message to standard error
  def self.error(text)
    warn "ERR: \e[0;31m#{text}\e[0m"
  end

  # Sends a decorated message to standard output in blue
  def self.info(text)
    $stdout.puts "INFO: \e[0m#{text}\e[0m"
  end
end
