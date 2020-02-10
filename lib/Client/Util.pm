package Client::Util;
use strict;
use warnings;
use utf8;

sub is_valid_text {
    my ($self, $text) = @_;
    my $length = length $text;
    use Data::Dumper;
    print Dumper($text);
    print Dumper($length);
    return $length <= 140;
}

1;
