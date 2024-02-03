package Mo::utils::URI;

use base qw(Exporter);
use strict;
use warnings;

use Data::Validate::URI qw(is_uri);
use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_uri);

our $VERSION = 0.01;

sub check_uri {
	my ($self, $key) = @_;

	if (! exists $self->{$key}) {
		return;
	}

	my $value = $self->{$key};
	if (! is_uri($value)) {
		err "Parameter '".$key."' doesn't contain valid URI.",
			'Value', $value,
		;
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Mo::utils::URI - Mo utilities for URI.

=head1 SYNOPSIS

 use Mo::utils::URI qw(check_uri);

 check_uri($self, $key);

=head1 DESCRIPTION

Mo utilities for URI checking of data objects.

=head1 SUBROUTINES

=head2 C<check_uri>

 check_uri($self, $key);

Check parameter defined by C<$key> which is valid URI.

Put error if check isn't ok.

Returns undef.

=head1 ERRORS

 check_uri(): 
         Parameter '%s' doesn't contain valid URI.
                 Value: %s

=head1 EXAMPLE1

=for comment filename=check_uri_ok.pl

 use strict;
 use warnings;

 use Mo::utils::URI qw(check_uri);

 my $self = {
         'key' => 'https://skim.cz',
 };
 check_uri($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE2

=for comment filename=check_uri_fail.pl

 use strict;
 use warnings;

 use Error::Pure;
 use Mo::utils::URI qw(check_uri);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => 'bad_uri',
 };
 check_uri($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [..utils.pm:?] Parameter 'key' doesn't contain valid URI.

=head1 DEPENDENCIES

L<Data::Validate::URI>,
L<Error::Pure>,
L<Exporter>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Mo>

Micro Objects. Mo is less.

=item L<Mo::utils::Language>

Mo language utilities.

=item L<Wikibase::Datatype::Utils>

Wikibase datatype utilities.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Mo-utils-URI>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2024 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
