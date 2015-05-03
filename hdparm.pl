#!/usr/bin/perl
use strict;
use warnings;
use Data::Printer;
use 5.10.1;

if (!@ARGV) {
 say "Specify drive letters as single letters directly. E.g., for /dev/sda/ provide 'a'." && exit 0;     
}

my $arg = join "", @ARGV; #combine arguments to scalar
$arg =~ s/\s+//g; # trim any spaces
my @arg = split "", $arg; #split trimmed scalar into array

foreach(@arg) {
  my $drive_letter = $_;
  my $diag = qx(hdparm -I /dev/sd$drive_letter);
  my ($model) = $diag =~ m/\s*Model Number:\s*(.*?)\s{2,}/i;
  say "$model: ";

  my $result = qx(hdparm -tT /dev/sd$drive_letter);
  my @result = split("\n", $result);
  say $result;
}
