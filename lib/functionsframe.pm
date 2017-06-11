package pimPSK::App::functionsFrame; 
use strict; 
use warnings; 
use Wx qw(:everything); 

use Wx::Event qw(EVT_MOTION); 
use Wx::MDI;
sub new { 
    
    my ( $self ) = @_;
	
	my $ID_MYFRAME =  1;
	my $ID_MYCHILD1 = 2;
	my $ID_MYCHILD2 = 3;
	my $ID_MYCHILD3 = 4;
	my $ID_MYCHILD4 = 5;
	
	my $parentFrame = Wx::MDIParentFrame->new($self, $ID_MYFRAME, "Functions",[640,480]);
	my $statusBar = Wx::StatusBar->new($parentFrame, wxID_ANY, wxST_SIZEGRIP); 
    $parentFrame->SetStatusBar($statusBar); 
    $statusBar->SetStatusText("These are the Functions!", 0);
	
	my $childFrame1 = Wx::MDIChildFrame->new($parentFrame, $ID_MYCHILD1, "RX");
	my $childFrame2 = Wx::MDIChildFrame->new($parentFrame, $ID_MYCHILD2, "TX");
	pimPSK::App::txtab::assortedControls($childFrame2);
	my $childFrame3 = Wx::MDIChildFrame->new($parentFrame, $ID_MYCHILD3, "Network");
	my $childFrame4 = Wx::MDIChildFrame->new($parentFrame, $ID_MYCHILD4, "Debug");
				
	$childFrame1->Show(1);
	$childFrame2->Show(1);
	$childFrame3->Show(1);
	$childFrame4->Show(1);
	$parentFrame->Show(1);

     
   
    return $self; 
} 
1;
