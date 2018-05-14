package MojoCoinClient::Transaction;

use Mojo::JSON 'encode_json';
use Mojo::Util 'b64_encode', 'b64_decode';
use Crypt::Digest::SHA1 'sha1';
use Crypt::PK::RSA;
use Moo;

has [qw/sender_address
  sender_private_key
  recipient_address
  amount/] => (is=>'ro', required=>1);

sub transaction_body {
  my $self = shift;
  return +{
    sender_address => $self->sender_address,
    recipient_address => $self->recipient_address,
    value => $self->amount,
  };
}

sub sign_transaction {
  my $self = shift;
  my $sender_private_key = b64_decode($self->sender_private_key);
  my $private_key = Crypt::PK::RSA->new(\$sender_private_key);
  my $hash = sha1(encode_json($self->transaction_body));
  return b64_encode($private_key->sign_message($hash),'');
}

1;
