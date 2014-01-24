package Moo::Lax;

#ABSTRACT: By default Moo turns all warnings to fatal warnings. C<Moo::Lax> is exactly the same as C<Moo>, except that it doesn't turn all warnings to fatal warnings in the calling module.

=head1 SYNOPSIS

  # instead of use Moo;
  use Moo::Lax;

=cut

require strictures;
my $orig = \&strictures::import;
require Moo;
sub import {
    *strictures::import = sub { *strictures::import = $orig };
    splice @_, 0, 1, 'Moo'; goto &Moo::import;
}

1
