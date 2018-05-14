#!/usr/bin/env perl

use lib './lib';
use Mojo::Util 'b64_encode';
use Mojolicious::Lite;
use MojoCoinClient::Transaction;
use MojoCoinClient::Form::Transaction;
use MojoCoinClient::Wallet;

helper new_wallet => sub { MojoCoinClient::Wallet->new };
helper transaction_form => sub { state $form = MojoCoinClient::Form::Transaction->new };
helper transaction => sub { shift; MojoCoinClient::Transaction->new(@_) };

get '/' => sub {
  shift->reply->static('client/index.html');
};

get '/make/transaction' => sub {
  shift->reply->static('client/make_transaction.html');
};

get '/view/transactions' => sub {
  shift->reply->static('client/view_transactions.html');
};

get '/wallet/new' => sub {
  my $pk = (my $c = shift)->new_wallet;
  $c->render(json => {
    private_key => b64_encode($pk->export_private_key, ''),
    public_key => b64_encode($pk->export_public_key, ''),
  });
};

post '/generate/transaction' => sub {
  my $transaction_form = (my $c = shift)->transaction_form;
  $transaction_form->process(params => +{
        sender_address => $c->param('sender_address'),
        sender_private_key => $c->param('sender_private_key'),
        recipient_address => $c->param('recipient_address'),
        amount => $c->param('amount'),
    });
  if($transaction_form->validated) {
    my $transaction = $c->transaction($transaction_form->fif);
    $c->render(json => {
      signature => $transaction->sign_transaction,
      transaction_body => $transaction->transaction_body,
    });
  } else {
    # TODO: return errors
  }
};

app->start;
