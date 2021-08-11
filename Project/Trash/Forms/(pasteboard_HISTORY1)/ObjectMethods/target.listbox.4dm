// ----------------------------------------------------
// Object method : pasteboard_HISTORY.listbox - (studio.4DB)
// Created 07/03/11 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_formEvent)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------
Case of 
		
		//______________________________________________________
	: ($Lon_formEvent=On Selection Change:K2:29)
		
		OBJECT SET ENABLED:C1123(*; "b.@"; Find in array:C230((OBJECT Get pointer:C1124(Object named:K67:5; "target.listbox"))->; True:C214)>0)
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Unnecessarily activated form event")
		
		//______________________________________________________
End case 
