# --
# Kernel/Output/HTML/OutputFilterMediaWiki.pm
# Copyright (C) 2011 - 2015 Complemento - Liberdade e Tecnologia http://www.complemento.net.br
# --
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::OutputFilterCadeOAnexo;

use strict;
use warnings;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
    my %Data = ();
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
   
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    # get template name
#AttachmentTip::AttachmentTip###Words
	my $Words = $ConfigObject->Get('CadeOAnexo::Words');
	$Data{Words} = $Words ;
   # Mostra widget central com iframe da pagina
	my $iFrame = $LayoutObject->Output(
    	    TemplateFile => 'ShowCadeOAnexo',
	        Data         => \%Data,
    	);
	   ${ $Param{Data} } .= $iFrame ;
 
}
1;

