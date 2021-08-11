//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project method : pastboard_drop_explorer
// ID[26924072736A4E92AB7F64E8217DD116]
// Created 19/05/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_POINTER:C301($1)

C_LONGINT:C283($Lon_parameters)

If (False:C215)
	C_POINTER:C301(pasteboard_drop_explorer; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	// NO PARAMETERS REQUIRED
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
pasteboard_drop_viewer

// ----------------------------------------------------
// End