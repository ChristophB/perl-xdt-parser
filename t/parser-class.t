#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use xDT::Parser;

my $xdt_string
	= "01380006311\n014810000176\n01092063\n014921802.10\n01030002\n0173101Testmann\n0173102Thorsten\n"
	. "017310306101970\n017620016052011\n0158402SONO00\n017843216052011\n0158439161859";

plan tests => 6;

can_ok 'xDT::Parser', 'new';
can_ok 'xDT::Parser', 'open';
can_ok 'xDT::Parser', 'close';
can_ok 'xDT::Parser', 'next_object';

subtest 'should parse string', sub {
	isa_ok my $parser = xDT::Parser->new, 'xDT::Parser';
	$parser->open(string => $xdt_string);

	isa_ok my $object = $parser->next_object, 'xDT::Object';
	is $object->get_value(3101), 'Testmann', 'value as expected';

	$parser->close;
};

subtest 'should parse with config xml', sub {
	my $configs = xDT::Parser::build_config_from_xml('config/record_types.xml');
	is scalar @$configs, 34, 'number of config entries as expected';

	my ($config) = grep { $_->{id} eq '9206' } @$configs;
	ok $config, 'config for 9206 exists';
	is $config->{length}, 1, 'length as expected';
	is $config->{type}, 'num', 'type as expected';
	is $config->{accessor}, 'charset', 'accessor as expected';
	is $config->{labels}->{en}, 'Used Character Set', 'en label as expected';
	is $config->{labels}->{de}, 'Verwendeter Zeichensatz', 'de label as expected';

	isa_ok my $parser = xDT::Parser->new(record_type_config => $configs), 'xDT::Parser';
	is @{$parser->record_type_config}, 34, 'config populated from xml';
	$parser->open(string => $xdt_string);

	is $parser->next_object->get_value('surname'), 'Testmann', 'value as expected';
};

done_testing;
