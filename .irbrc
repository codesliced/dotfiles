# non-wirble auto-complete
require 'irb/completion'
# Awesome Print colorizes output like strings and arrays
require "awesome_print"
# Pretty print is a standard of ruby 2+ for formatting
require 'pp'
# Wirble formats output
require 'wirble'

begin
  # init wirble
  Wirble.init
  Wirble.colorize
  rescue LoadError => err
  $stderr.puts "Couldn't load Wirble: #{err}"
end


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

# loads simple IRB (without RVM notice) Simple Prompt has no line numbers
IRB.conf[:PROMPT_MODE] = :SIMPLE

# loads awesome_print
AwesomePrint.irb!

# A clear command like in unix
def clear
  system('clear')
end

puts ("Loading ~/.irbc a file that loads everytime you load irb")
