#!/usr/bin/perl 
 
# based on CppTrial-pg019.pl 
# Cross-Platform GUI Programming with wxWidgets - Smart, Hock, & Csomor 
# C++ Example from pg 19 - Create a basic frame with menus and status bar 
# Ported to wxPerl by James M. Lynes Jr. - 5/18/2011 
 
package main; 
 
use 5.008; 
use strict; 
use warnings; 
use lib ('/lib/');
require lib::functionsframe;
require lib::functiontabs; 
require lib::txtab;
require lib::rxtab;
require lib::networktab;
require lib::pimpskfunctions;
require lib::mainwindow;

$| = 1; 
 
# create the WxApplication 
my $app = pimPSK::App->new; 
$app->MainLoop; 
 
package pimPSK::App; 
 
use strict; 
use warnings; 
use base 'Wx::App'; 
use Wx::XRC;
#use Wx::DC;
 
sub OnInit { 
	pimPSK::App::pimpskfunctions->init();
    #my $frame = pimPSK::App::Frame->new;
    
    #$frame->Show(1); 
    my $functionsframe = pimPSK::App::Frame->new;
    pimPSK::App::functionstabs::mdiChildFrame($functionsframe);
    pimPSK::App::mainwindow::addcontent($functionsframe);
    $functionsframe->Show(1);
} 
 
package pimPSK::App::Frame; 
use strict; 
use warnings; 
use Wx qw(:everything); 
use base 'Wx::Frame'; 
use Wx qw(:everything);
use Wx::Event qw(EVT_MOTION); 
 
sub new { 
    my ($class) = @_; 
 
    my $self = $class->SUPER::new( 
        undef, -1, 
        'pimPSK', 
        wxDefaultPosition, wxDefaultSize, 
    ); 
 
    my $cutIcon = Wx::Icon->new( "cut.xpm", wxBITMAP_TYPE_XPM, -1, -1); 
    $self->SetIcon($cutIcon); 
 
    my $fileMenu = Wx::Menu->new();
    my $fldigiMenu = Wx::Menu->new(); 
    my $helpMenu = Wx::Menu->new(); 
    
    my $fldigisettings_autoconnectmenu = Wx::Menu->new();
#    # pg94----- CheckBox Control
#	my $ID_CHECKBOX = 3;
 #   my $checkBox = Wx::CheckBox->new($class, $ID_CHECKBOX, "&Autoconnect",Wx::Point->new(10,200), wxDefaultSize);
		       
#	$checkBox->SetValue(1);
#    $fldigisettings_autoconnectmenu->Append($checkBox);
    $fldigiMenu->AppendSubMenu($fldigisettings_autoconnectmenu,"Auto&connect" );
    
    $fileMenu->Append(wxID_EXIT, "E&xit\tAlt-X", "Quit This Program");
    
    $helpMenu->Append(wxID_ABOUT, "&About...\tF1", "Show About Dialog"); 
     
    my $menuBar = Wx::MenuBar->new(); 
    $menuBar->Append($fileMenu, "&File"); 
    $menuBar->Append($fldigiMenu, "F&LDIGI");
    $menuBar->Append($helpMenu, "&Help"); 
     
    $self->SetMenuBar($menuBar); 
     
    my $statusBar = Wx::StatusBar->new($self, wxID_ANY, wxST_SIZEGRIP); 
    $self->SetStatusBar($statusBar); 
    $statusBar->SetStatusText("Welcome to wxWidgets!", 0); 
 
    return $self; 
} 
