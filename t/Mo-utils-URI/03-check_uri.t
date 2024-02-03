use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Mo::utils::URI qw(check_uri);
use Readonly;
use Test::More 'tests' => 5;
use Test::NoWarnings;

Readonly::Array our @RIGHT_URIS => qw(
	http://skim.cz
	https://skim.cz
);

# Test.
my ($ret, $self);
foreach my $right_uri (@RIGHT_URIS) {
	$self = {
		'key' => $right_uri,
	};
	$ret = check_uri($self, 'key');
	is($ret, undef, 'Right URI is present ('.$right_uri.').');
}

# Test.
$self = {};
$ret = check_uri($self, 'key');
is($ret, undef, 'Right not exist key.');

# Test.
$self = {
	'key' => 'foo',
};
eval {
	check_uri($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' doesn't contain valid URI.\n",
	"Parameter 'key' doesn't contain valid URI (foo).");
clean();

