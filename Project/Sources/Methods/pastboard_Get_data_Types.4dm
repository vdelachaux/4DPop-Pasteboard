//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : pastboard_Get_data_Types
// ID[15389FBECAFC493E8997676789A36392]
// Created 20/05/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Load in a list the data types of the current pastboard
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($0)

C_LONGINT:C283($Lon_i; $Lon_parameters; $Lst_dataTypes)

ARRAY TEXT:C222($tTxt_4Dsignatures; 0)
ARRAY TEXT:C222($tTxt_formatNames; 0)
ARRAY TEXT:C222($tTxt_nativeTypes; 0)

If (False:C215)
	C_LONGINT:C283(pastboard_Get_data_Types; $0)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	$Lst_dataTypes:=New list:C375
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
GET PASTEBOARD DATA TYPE:C958($tTxt_4Dsignatures; $tTxt_nativeTypes; $tTxt_formatNames)

For ($Lon_i; 1; Size of array:C274($tTxt_4Dsignatures); 1)
	
	If (Is macOS:C1572)
		
		APPEND TO LIST:C376($Lst_dataTypes; $tTxt_nativeTypes{$Lon_i}; $Lon_i)
		
	Else 
		
		APPEND TO LIST:C376($Lst_dataTypes; $tTxt_formatNames{$Lon_i}; $Lon_i)
		
	End if 
	
	SET LIST ITEM PARAMETER:C986($Lst_dataTypes; 0; "4D"; $tTxt_4Dsignatures{$Lon_i})
	SET LIST ITEM PARAMETER:C986($Lst_dataTypes; 0; "native"; $tTxt_nativeTypes{$Lon_i})
	SET LIST ITEM PARAMETER:C986($Lst_dataTypes; 0; "format"; $tTxt_formatNames{$Lon_i})
	
End for 

SORT LIST:C391($Lst_dataTypes)

$0:=$Lst_dataTypes

// ----------------------------------------------------
// End