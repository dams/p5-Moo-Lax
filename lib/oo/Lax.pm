package oo::Lax;
 
#ABSTRACT: By default oo turns all warnings to fatal warnings. C<oo::Lax> is exactly the same as C<oo>, except that it doesn't turn all warnings to fatal warnings in the calling module.

use strictures 1;
use Moo::_Utils;
 
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
 
BEGIN {
    my $package;
    sub import {
        moo() if $0 eq '-';
        $package = $_[1] || 'Class';
        if ($package =~ /^\+/) {
            $package =~ s/^\+//;
            _load_module($package);
        }
    }
    use Filter::Simple sub { s/^/package $package;\nuse Moo::Lax;\n/; }
}
 
1;
