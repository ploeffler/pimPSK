package pimPSK::App::mainwindow::connectbutton;
use strict; 
use warnings; 
use Wx qw(:everything);
#use base 'Wx::ToggleButton'; 
#use Wx qw(:everything);
use Wx::Event qw(EVT_BUTTON);
sub init {
	my ($self) = @_;
#	my $ID_TOGGLEBUTTON2 = 100; 
#	print $class;
#    my $self = $class->SUPER::new(undef,$class,-1,"CONNECT", Wx::Point->new(10,10), wxDefaultSize); 
#    $self->SetValue(1);
#	$self->SetName("Cnnecting");
#    EVT_BUTTON( $self, $button, \&OnClick );
	return $self;
}

sub OnInit {
}

sub OnClick {
my( $self, $event ) = @_;

    $self->SetTitle( 'Clicked' );
}
1;