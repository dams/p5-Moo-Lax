package Moo::Role::Lax;

#ABSTRACT: By default Moo::Role turns all warnings to fatal warnings. This module is exactly the same as Moo::Role, except that it doesn't turn all warnings to fatal warnings in the calling module.

=head1 SYNOPSIS

  # instead of use Moo::Role;
  use Moo::Role::Lax;

=cut

use strict;
use warnings;

require strictures;
my $orig = \&strictures::import;
require Moo::Role;
sub import {
    no warnings 'redefine';
    *strictures::import = sub {
        strict->import; warnings->import;
        *strictures::import = $orig;
    };
    splice @_, 0, 1, 'Moo::Role'; goto &Moo::Role::import;
}

1
