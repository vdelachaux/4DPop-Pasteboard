// ----------------------------------------------------
// Form method : pasteboard_preview
// Created 03/03/11 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_formEvent)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------

Case of 
		//______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		
		SET TIMER:C645(-1)
		//______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		OBJECT SET ENABLED:C1123(*; "b.preview"; True:C214)
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		SET TIMER:C645(0)
		
		IDLE:C311
		
		SET TIMER:C645(50)
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily")
		
		
		//______________________________________________________
End case 