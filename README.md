# xDT-Parser

This module can be used to parse GDT/BDT files used by german licensed physicians
to exchange medical data between their patient data management system and other systems
(e.g. medical equipment, health insurances). 


## INSTALLATION

This module requires the following perl modules to be installed:

    Moose
    Test::Class:Moose::Load
    namespace::autoclean
    XML::Simple

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install

## SUPPORT AND DOCUMENTATION

After installing, you can find documentation for this module with the
perldoc command.

    perldoc xDT::Parser

You can also look for information at:

    RT, CPAN's request tracker (report bugs here)
        http://rt.cpan.org/NoAuth/Bugs.html?Dist=xDT-Parser

    AnnoCPAN, Annotated CPAN documentation
        http://annocpan.org/dist/xDT-Parser

    CPAN Ratings
        http://cpanratings.perl.org/d/xDT-Parser

    Search CPAN
        http://search.cpan.org/dist/xDT-Parser/


## LICENSE AND COPYRIGHT

Copyright (C) 2017 Christoph Beger

This program is released under the following license: MIT
