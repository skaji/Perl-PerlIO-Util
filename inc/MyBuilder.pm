package MyBuilder;
use strict;
use warnings;
use base 'Module::Build::XSUtil';

sub new {
    my $class = shift;
    $class->SUPER::new(
        c_source => ["c_source"],
        cc_warnings => 1,
        @_,
    );
}

1;
