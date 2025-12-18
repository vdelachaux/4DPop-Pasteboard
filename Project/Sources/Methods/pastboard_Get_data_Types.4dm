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
#DECLARE() : Integer

ARRAY TEXT:C222($4Dsignatures; 0)
ARRAY TEXT:C222($formatNames; 0)
ARRAY TEXT:C222($nativeTypes; 0)

var $dataTypes:=New list:C375

GET PASTEBOARD DATA TYPE:C958($4Dsignatures; $nativeTypes; $formatNames)

var $i : Integer
For ($i; 1; Size of array:C274($4Dsignatures); 1)
	
	If (Is macOS:C1572)
		
		APPEND TO LIST:C376($dataTypes; $nativeTypes{$i}; $i)
		
	Else 
		
		APPEND TO LIST:C376($dataTypes; $formatNames{$i}; $i)
		
	End if 
	
	SET LIST ITEM PARAMETER:C986($dataTypes; 0; "4D"; $4Dsignatures{$i})
	SET LIST ITEM PARAMETER:C986($dataTypes; 0; "native"; $nativeTypes{$i})
	SET LIST ITEM PARAMETER:C986($dataTypes; 0; "format"; $formatNames{$i})
	
End for 

SORT LIST:C391($dataTypes)

return $dataTypes