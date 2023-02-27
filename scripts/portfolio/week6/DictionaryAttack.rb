###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Ruby dictionary attack script. 

###################################################################

#!/usr/local/rvm/gems/ruby-3.1.3/bin/ruby

require 'digest'

# read the password hash
passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"

# open the wordlist and repeat for each word
File.foreach("wordlist.txt") do |word|
  word.chomp!
  # hash the word
  wordlistHash = Digest::SHA256.hexdigest(word)
  puts("Trying password #{word}: #{wordlistHash}")
  # if the hash is the same as the correct password's hash then we have cracked the password!
  if(wordlistHash == passwordHash)
    puts("Password has been cracked! It was #{word}")
    exit
  end
end