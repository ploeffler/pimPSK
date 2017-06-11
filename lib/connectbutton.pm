package pimPSK::App::mainwindow::connectbutton;
use strict; 
use warnings; 
use Wx qw(:everything);
use base 'Wx::ToggleButton'; 
#use Wx qw(:everything);
sub new {
	my ($class) = @_;
	my $ID_TOGGLEBUTTON2 = 100; 
#	print $class;
    my $self = $class->SUPER::new(undef,$class, $ID_TOGGLEBUTTON2, "CONNECT", Wx::Point->new(10,10), wxDefaultSize); 
    $self->SetValue(0);
	return $self;
}

sub OnInit {
}

sub OnClick {

}
1;