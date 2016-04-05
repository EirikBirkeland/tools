#!/usr/bin/env perl
use strict;
use warnings;
use 5.10.1;

if (scalar @ARGV != 2) {
      say "Invalid number of arguments."; exit 0;
}

system("git add $ARGV[0]");
system("git commit -m $ARGV[1]");
system('git push -u origin master');
