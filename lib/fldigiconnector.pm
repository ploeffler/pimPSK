package pimPSK::App::fldigiconnector;
use strict; 
use warnings; 
use XML::RPC; 

sub new { 
    my ($class) = @_; 
 
    my $self = XML::RPC->new('http://localhost:7362/');
    return $self;  
    }
1;