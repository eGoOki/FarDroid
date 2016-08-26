#!/usr/local/bin/perl

open F, "../version.info";
while (<F>) 
{
  /#define\s+\w+\s+(\d+)/;
  push @version,$1;
}
close F;

local $/;
open F, "../fardroid.rc";
$_ = <F>;
close F;

$v = join ", ", map int, @version[0..3];
print "Changed ".s/(fileversion[^\d]+)[\d,\t\ ]+/$1$v/ig." strings";

open F, ">../fardroid.rc";
print F $_;
close F;
