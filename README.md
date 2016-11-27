# NAME

PerlIO::Util - A selection of general PerlIO utilities

# SYNOPSIS

    use PerlIO::Util;

    # utility layers

    # open and flock(IN, LOCK_EX)
    $io = PerlIO::Util->open('+< :flock', $file);

    # open with O_CREAT | O_EXCL
    $io = PerlIO::Util->open('+<:creat :excl', $file);

    my $out = PerlIO::Util->open('>:tee', 'file.txt', \$scalar, \*STDERR);
    print $out 'foo'; # print to 'file.txt', $scalar and *STDERR

    # utility routines

    *STDOUT->push_layer(scalar => \$scalar); # it dies on fail
    print 'foo'; # to $scalar

    print *STDOUT->pop_layer(); # => scalar
    print $scalar; # to *STDOUT

# DESCRIPTION

`PerlIO::Util` provides general PerlIO utilities: utility layers and utility
methods.

Utility layers are a part of `PerlIO::Util`, but you don't need to
say `use PerlIO::Util` for loading them. They will be automatically loaded.

# UTILITY LAYERS

## :flock 

Easy interface to `flock()`.

See [PerlIO::flock](https://metacpan.org/pod/PerlIO::flock).

## :creat

Use of O\_CREAT without `Fcntl`.

See [PerlIO::creat](https://metacpan.org/pod/PerlIO::creat).

## :excl

Use of O\_EXCL without `Fcntl`.

See [PerlIO::excl](https://metacpan.org/pod/PerlIO::excl).

## :tee

Multiplex output stream.

See [PerlIO::tee](https://metacpan.org/pod/PerlIO::tee).

## :dir

PerlIO interface to directory functions.

See [PerlIO::dir](https://metacpan.org/pod/PerlIO::dir).

## :reverse

Reverse input stream.

See [PerlIO::reverse](https://metacpan.org/pod/PerlIO::reverse).

## :fse

Mediation of filesystem encoding.

This layer was split into an independent distribution, `PerlIO::fse`.

See [PerlIO::fse](https://metacpan.org/pod/PerlIO::fse).

# UTILITY METHODS

## PerlIO::Util->open(_mode_, _args_)

Calls built-in `open()`, and returns an `IO::Handle` instance named _args_.
It dies on fail.

Unlike Perl's `open()` (nor `IO::File`'s), _mode_ is always required. 

## PerlIO::Util->known\_layers( )

Returns the known layer names.

## _FILEHANDLE_->get\_layers( )

Returns the names of the PerlIO layers on _FILEHANDLE_.

See ["Querying the layers of filehandles" in PerlIO](https://metacpan.org/pod/PerlIO#Querying-the-layers-of-filehandles).

## _FILEHANDLE_->push\_layer(_layer_ \[ => _arg_\])

Almost equivalent to `binmode(FILEHANDLE, ':layer(arg)')`, but accepts
any type of _arg_, e.g. a scalar reference to the `:scalar` layer.

This method dies on fail. Otherwise, it returns _FILEHANDLE_.

## _FILEHANDLE_->pop\_layer( )

Equivalent to `binmode(FILEHANDLE, ':pop')`. It removes a top level layer
from _FILEHANDLE_, but note that you cannot remove dummy layers such as
`:utf8` or `:flock`.

This method returns the name of the popped layer.

# DEPENDENCIES

Perl 5.8.1 or later, and a C compiler.

# BUGS

No bugs have been reported.

Please report any bugs or feature requests to
&lt;gfuji(at)cpan.org>, or through the web interface at
[http://rt.cpan.org/](http://rt.cpan.org/).

# SEE ALSO

[PerlIO::flock](https://metacpan.org/pod/PerlIO::flock), [PerlIO::creat](https://metacpan.org/pod/PerlIO::creat), [PerlIO::excl](https://metacpan.org/pod/PerlIO::excl), [PerlIO::tee](https://metacpan.org/pod/PerlIO::tee),
[PerlIO::dir](https://metacpan.org/pod/PerlIO::dir), [PerlIO::reverse](https://metacpan.org/pod/PerlIO::reverse), [PerlIO::fse](https://metacpan.org/pod/PerlIO::fse).

[PerlIO](https://metacpan.org/pod/PerlIO) for `push_layer()` and `pop_layer()`.

[perliol](https://metacpan.org/pod/perliol) for implementation details.

["open" in perlfunc](https://metacpan.org/pod/perlfunc#open).

[perlopentut](https://metacpan.org/pod/perlopentut).

# AUTHOR

Goro Fuji (藤 吾郎) &lt;gfuji(at)cpan.org>.

# LICENSE AND COPYRIGHT

Copyright (c) 2008-2010, Goro Fuji &lt;gfuji(at)cpan.org>. Some rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.
