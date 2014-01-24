package Moo::Role::Lax;

#ABSTRACT: By default Moo::Role turns all warnings to fatal warnings. This module is exactly the same as Moo::Role, except that it doesn't turn all warnings to fatal warnings in the calling module.

require strictures;
my $orig = \&strictures::import;
require Moo;
sub import {
    *strictures::import = sub { *strictures::import = $orig };
    splice @_, 0, 1, 'Moo::Role'; goto &Moo::import;
}

1
