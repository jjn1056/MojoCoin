requires 'Mojolicious', '7.78';
requires 'CryptX', '0.060 ';

requires 'Catalyst', '5.90117';
requires 'Catalyst::Plugin::RedirectTo', '0.002';
requires 'Catalyst::Plugin::URI', '0.002';
requires 'Catalyst::Plugin::CurrentComponents', '0.007';
requires 'Catalyst::Plugin::InjectionHelpers', '0.010';
requires 'Catalyst::Plugin::ConfigLoader', '0.34';
requires 'Catalyst::Plugin::ServeFile', '0.003';
requires 'Catalyst::TraitFor::Request::ContentNegotiationHelpers', '0.006';
requires 'Catalyst::View::Base::JSON', '0.003';
requires 'Catalyst::Model::Data::MuForm', '0.001';
requires 'Data::MuForm', '0.04';
requires 'Import::Into', '1.002005';
requires 'HTTP::Tiny', '0.070';
requires 'Moose', '2.2010'; 
requires 'Module::Runtime', '0.016';
requires 'namespace::autoclean', '0.28';
requires 'Plack', '1.0047';
requires 'Plack::Middleware::CrossOrigin', '0.012';
requires 'signatures', '0.13';
requires 'JSON::MaybeXS', '1.004000';
requires 'Net::SSLeay', '1.85'; # For SSL support in HTTP::Tiny
requires 'IO::Socket::SSL', ' 2.056'; # For SSL support in HTTP::Tiny
requires 'URI', '1.74';

on test => sub {
  requires 'Catalyst::Test';
  requires 'HTTP::Request::Common', '6.11';
  requires 'Test::Most', '0.34';
};

on develop => sub {
  requires 'App::Ack', '2.14';
  requires 'Devel::Dwarn';
  requires 'App::cpanoutdated';
};
