package Moo::Lax;

#ABSTRACT: Loads Moo without turning warnings to fatal.

=head1 DEPRECATED

With the release of L<Moo> version 2, C<use Moo> no longer imports
L<strictures> by default and therefore warnings are not fatalised unless
an explicit C<use strictures> is added to the code.

As such, this module is no longer required - simply update your dependency
on Moo to version 2 and switch back to plain C<use Moo> in your classes.

=head1 DESCRIPTION

By default Moo turns all warnings to fatal warnings. C<Moo::Lax> is exactly the
same as C<Moo>, except that it doesn't turn all warnings to fatal warnings in
the calling module.

=head1 SYNOPSIS

  # instead of use Moo;
  use Moo::Lax;

=cut

use strict;
use warnings;

use Moo ();
use Import::Into;

sub import {
    no warnings 'uninitialized';
    my $previous_bits = ${^WARNING_BITS} & $warnings::DeadBits{all};
    local $ENV{PERL_STRICTURES_EXTRA} = 0;
    Moo->import::into(caller, @_);
    ${^WARNING_BITS} &= ~$warnings::DeadBits{all} | $previous_bits;
    return;
}

1;

=head1 CONTRIBUTORS

=over

=item *

Leon Timmermans

=back
