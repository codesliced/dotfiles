# Auto-complete for method names and such
require 'irb/completion'

# Loads awesome_print a gem for coloring and
# formatting output in irb
require "awesome_print"
AwesomePrint.irb!

# Loads simple IRB (without RVM notice)
IRB.conf[:PROMPT_MODE] = :SIMPLE


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

# A method for clearing the screen
def clear
  system('clear')
end

puts ("Loading ~/.irbc a file that loads everytime you load irb")
