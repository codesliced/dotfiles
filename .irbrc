# auto-complete for method names and such
require 'irb/completion'

# loads awesome_print
require "awesome_print"
AwesomePrint.irb!

# loads simple IRB (without RVM notice)
IRB.conf[:PROMPT_MODE] = :SIMPLE


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

# Unix like System lear
def clear
  system('clear')
end

puts ("Loading ~/.irbc a file that loads everytime you load irb")
