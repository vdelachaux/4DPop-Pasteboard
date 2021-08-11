// ----------------------------------------------------
// Form method : clipboard_HISTORY
// ID[8E2AD99C8A6A45259963D20E3D192CF1]
// Created 22-5-2020 by Vincent de Lachaux
// ----------------------------------------------------
C_LONGINT:C283($bottom; $height; $lButton; $left; $mouseX; $mouseY)
C_LONGINT:C283($offset; $right; $top; $width)
C_OBJECT:C1216($event)

// ----------------------------------------------------
// Initialisations
$event:=FORM Event:C1606

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($event.code=On Load:K2:1)
		
		clip.ui:=Current form window:C827
		
		OBJECT SET SCROLLBAR:C843(*; "history"; 0; 2)
		
		Form:C1466.history:=clip.history
		
		//______________________________________________________
	: ($event.code=On Unload:K2:2)
		
		clip.ui:=Null:C1517
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily ("+$event.description+")")
		
		//______________________________________________________
End case 