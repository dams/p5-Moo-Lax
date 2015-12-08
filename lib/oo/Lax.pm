package oo::Lax;
 
#ABSTRACT: Loads oo without turning warnings to fatal.

=head1 DEPRECATED

With the release of L<Moo> version 2, C<use Moo> no longer imports
L<strictures> by default and therefore warnings are not fatalised unless
an explicit C<use strictures> is added to the code.

As such, this module is no longer required - simply update your dependency
on Moo to version 2 and switch back to plain C<use Moo> in your classes.

Thus, as per version 2.00, this module simply requires L<Moo> version 2.

=head1 DESCRIPTION

By default oo turns all warnings to fatal warnings. C<oo::Lax> is exactly the
same as C<oo>, except that it doesn't turn all warnings to fatal warnings in
the calling module.

=cut

use Import::Into;
use oo ();

=head2 moo

  Tip: run C<perl -Moo::Lax>, a cow should appear.

=cut

sub moo {
  print <<'EOMOO';
 _________________
< Moo, but relax! >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
EOMOO
  exit 0;
}

sub import {
    moo() if $0 eq '-';
    shift;
    oo->import::into(1, @_);
}

1;
