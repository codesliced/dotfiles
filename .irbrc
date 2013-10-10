# auto-complete for method names and such
require 'irb/completion'

# loads awesome_print a gem for coloring and
# formatting output in irb
# adding awesome_print to your gemfile will ensure
# functionality on projects with gemfiles
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
