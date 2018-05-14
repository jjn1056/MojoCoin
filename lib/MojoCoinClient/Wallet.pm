package MojoCoinClient::Wallet;

use Crypt::PK::RSA;
use Moo;

has key_pair => (
  is=>'ro',
  required=>1,
  handles=>['export_key_der'],
  builder=>'_build_key_pair');

  sub _build_key_pair {
    my $pk = Crypt::PK::RSA->new;
    return $pk->generate_key;
  }

sub export_private_key {
  return shift->export_key_der('private');
}

sub export_public_key {
  return shift->export_key_der('public');
}

1;
