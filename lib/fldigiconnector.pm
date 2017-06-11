package pimPSK::App::fldigiconnector;
use strict; 
use warnings; 
use XML::RPC; 

sub new { 
    my ($class) = @_; 
 
    my $self = XML::RPC->new('http://localhost:7362/');
    return $self;  
    }
 sub getversion {
 my ($class) = @_; 
 my $self = $class->call('fldigi.name_version');
 return $self;
 }
1;