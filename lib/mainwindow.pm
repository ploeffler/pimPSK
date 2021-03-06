package pimPSK::App::mainwindow;
use strict; 
use warnings; 
use Wx qw(:everything); 

require lib::connectbutton;

sub addcontent {


 my ( $self ) = @_; 
 
# Create a panel to place all of the controls on     
    my $panel= Wx::Panel->new($self, 100, wxDefaultPosition, [800,600]); 
# pg111---- Toggle Button 
    my $ID_TOGGLEBUTTON1 = 14; 
     my $togglebutton1 = Wx::ToggleButton->new($panel, $ID_TOGGLEBUTTON1, "Connect FLDIGI", 
               Wx::Point->new(10,10), wxDefaultSize); 
    $togglebutton1->SetValue(0); 
    $togglebutton1 = pimPSK::App::mainwindow::connectbutton->init($togglebutton1);
	pimPSK::App::mainwindow::connectbutton::EVT_BUTTON( $self, $togglebutton1, \&OnClick );

# pg94----- CheckBox Control 
    my $ID_CHECKBOX = 3; 
    my $checkBox = Wx::CheckBox->new($panel, $ID_CHECKBOX, "Disonnected", Wx::Point->new(130,10), wxDefaultSize); 
    $checkBox->SetValue(0);     

# pg111---- Toggle Button 
    my $ID_TOGGLEBUTTON2 = 15; 
    my $togglebutton2 = Wx::ToggleButton->new($panel, $ID_TOGGLEBUTTON2, "&CQ", 
               Wx::Point->new(10,50), wxDefaultSize); 
    $togglebutton2->SetValue(0);
     
    
              
    my $ID_RADIOBOX = 6; 
    my @strings5 = ("off", "5m", "10m", "30m", "60m","90m"); 
    my $radiobox = Wx::RadioBox->new($panel, $ID_RADIOBOX, "Auto CQ",
               Wx::Point->new(130,30), wxDefaultSize, \@strings5, 
               3, wxRA_SPECIFY_COLS);
 
         
 
     
# pg95----- ListBox Control 
    my $ID_LISTBOX = 4; 
    my @strings3 = ("First String", "Second String", "Third String", 
                "Fourth String", "Fifth String", "Sixth String"); 
    my $listbox = Wx::ListBox->new($panel, $ID_LISTBOX, 
              Wx::Point->new(200,200), Wx::Size->new(180,80), 
              \@strings3, wxLB_SINGLE); 
 
# pg96----- CheckListBox Control 
    my $ID_CHECKLISTBOX = 5; 
    my @strings4 = ("1st String", "2nd String", "3rd String", 
                "4th String", "5th String", "6th String"); 
    my $checklistbox = Wx::CheckListBox->new($panel, $ID_CHECKLISTBOX, 
                   Wx::Point->new(200,300), Wx::Size->new(180,80), 
                   \@strings4, wxLB_SINGLE); 
  
 
# pg101---- Radio Button Control (Spacing forced for display purposes +- Sizers want to use whole window) 
    my $ID_RADIOBUTTON1 = 7; 
    my $ID_RADIOBUTTON2 = 8; 
    my $radioButton1 = Wx::RadioButton->new($panel, $ID_RADIOBUTTON1, 
               "&Male", Wx::Point->new(10,400), wxDefaultSize, wxRB_GROUP); 
    $radioButton1->SetValue(1); 
    my $radioButton2 = Wx::RadioButton->new($panel, $ID_RADIOBUTTON2, 
               "&Female", Wx::Point->new(75,400)); 
    my $topSizer = Wx::BoxSizer->new(wxHORIZONTAL); 
    my $boxSizer = Wx::BoxSizer->new(wxHORIZONTAL); 
    $boxSizer->Add($radioButton1, 0, wxALIGN_CENTER_VERTICAL | wxALL,5); 
    $boxSizer->Add($radioButton2, 0, wxALIGN_CENTER_VERTICAL | wxALL,5); 
#    $topSizer->Add($boxSizer,  0, wxALIGN_CENTER_VERTICAL | wxALL, 5); 
#    $self->SetSizer($topSizer); 
 
# pg102---- ScrollBar Control 
    my $ID_SCROLLBAR = 9; 
    my $scrollbar = Wx::ScrollBar->new($panel, $ID_SCROLLBAR, 
            Wx::Point->new(10,450), Wx::Size->new(200,20), wxSB_HORIZONTAL); 
 
# pg103---- Spin Button Control 
    my $ID_SPINBUTTON = 10; 
    my $spinbutton = Wx::SpinButton->new($panel, $ID_SPINBUTTON, 
             Wx::Point->new(330,400), wxDefaultSize, wxSP_VERTICAL); 
 
# pg105---- Spin Control 
    my $ID_SPINCONTROL = 11; 
    my $spincontrol = Wx::SpinCtrl->new($panel, $ID_SPINCONTROL, "5", 
              Wx::Point->new(250,450), wxDefaultSize, 
              wxSP_ARROW_KEYS, 0, 100, 5); 
               
# pg106---- Slider Control 
    my $ID_SLIDERCONTROL = 12; 
    my $slidercontrol = Wx::Slider->new($panel, $ID_SLIDERCONTROL, 16, 0, 40, 
                Wx::Point->new(10,500), Wx::Size->new(200, -1), 
                wxSL_HORIZONTAL | wxSL_AUTOTICKS | wxSL_LABELS); 
 
# pg108---- Text Control (w/pg109 also) 
    my $ID_TEXTCONTROL = 13; 
    my $textcontrol = Wx::TextCtrl->new($panel, $ID_TEXTCONTROL, "", 
              Wx::Point->new(250,500), Wx::Size->new(240, 100), 
              wxTE_MULTILINE); 
    $textcontrol->SetDefaultStyle(Wx::TextAttr->new(wxRED)); 
    $textcontrol->AppendText("Red Text\n"); 
    $textcontrol->SetDefaultStyle(Wx::TextAttr->new(wxNullColour, wxLIGHT_GREY)); 
    $textcontrol->AppendText("Red on Gray Text\n"); 
    $textcontrol->SetDefaultStyle(Wx::TextAttr->new(wxBLUE)); 
    $textcontrol->AppendText("Blue on Gray Text\n"); 
 

 
# pg112---- Guage Control 
    my $ID_GAUGE = 15; 
    my $gauge = Wx::Gauge->new($panel, $ID_GAUGE, 200, 
            Wx::Point->new(10,600), wxDefaultSize, wxGA_HORIZONTAL); 
    $gauge->SetValue(50); 
     
# pg113---- Static Text Control 
    my $ID_STATICTEXT = 16; 
    my $statictext = Wx::StaticText->new($panel, $ID_STATICTEXT, 
             "This is my &static text label", 
             Wx::Point->new(250,600), wxDefaultSize, wxALIGN_LEFT);   
 
 
# pg114---- Static Bitmap Control 
    my $ID_STATICBITMAP = 17; 
    my $bmp2 = Wx::Bitmap->new("print.xpm", wxBITMAP_TYPE_XPM); 
    my $staticbitmap = Wx::StaticBitmap->new($panel, $ID_STATICBITMAP, $bmp2, 
               Wx::Point->new(175, 600), wxDefaultSize); 
 
# pg115---- Static Line Control 
    my $ID_STATICLINE = 18; 
    my $staticline = Wx::StaticLine->new($panel, $ID_STATICLINE, 
             Wx::Point->new(10, 650), Wx::Size->new(450,-1), 
             wxLI_HORIZONTAL); 
 
# pg116---- Static Box Control 
    my $ID_STATICBOX = 19; 
    my $staticbox = Wx::StaticBox->new($panel, $ID_STATICBOX, 
            "&Static Box", 
            Wx::Point->new(350, 10), Wx::Size->new(100, 100)); 
return $self;  






}


1;