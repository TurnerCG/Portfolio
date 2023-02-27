###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Perl dictionary attack script. 

###################################################################

#!/usr/bin/perl

use Digest::SHA qw(sha256_hex);

# read the password hash
$passwordHash = "04e77bf8f95cb3e1a36a59d1e93857c411930db646b46c218a0352e432023cf2";

# open the wordlist
open(WORDLIST, "<", "wordlist.txt") or die "Could not open file wordlist.txt: $!";

# for each word in the file
while(<WORDLIST>) {
    chomp;
    $word = $_;
    # hash the word
    $wordlistHash = sha256_hex($word);
    print "$word: $wordlistHash\n";
    # if the hash is the same as the correct password's hash then we have cracked the password!
    if($wordlistHash eq $passwordHash) {
        print("Password has been cracked! It was $word\n");
        exit;
    }
}

close WORDLIST;
