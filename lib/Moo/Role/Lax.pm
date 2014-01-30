package Moo::Role::Lax;

#ABSTRACT: Loads Moo::Role without turning warnings to fatal.

=head1 DESCRIPTION

By default Moo::Role turns all warnings to fatal warnings. This module is
exactly the same as Moo::Role, except that it doesn't turn all warnings to
fatal warnings in the calling module.

=head1 SYNOPSIS

  # instead of use Moo::Role;
  use Moo::Role::Lax;

=cut

use strict;
use warnings;

use Moo::Role ();
use Import::Into;

sub import {
    no warnings 'uninitialized';
    my $previous_bits = ${^WARNING_BITS} & $warnings::DeadBits{all};
    local $ENV{PERL_STRICTURES_EXTRA} = 0;
    Moo::Role->import::into(caller, @_);
    ${^WARNING_BITS} &= ~$warnings::DeadBits{all} | $previous_bits;
    return;
}

1

=head1 CONTRIBUTORS

=over

=item *

Leon Timmermans

=back
