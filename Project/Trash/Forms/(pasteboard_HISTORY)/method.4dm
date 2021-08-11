// ----------------------------------------------------
// Form method : pasteboard_HISTORY
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
		
		OBJECT SET ENABLED:C1123(*; "b.@"; False:C215)
		
		<>tTxt_pastboards:=0
		
		SET TIMER:C645(-1)
		//______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		SET TIMER:C645(0)
		
		C_LONGINT:C283($Lon_button; $Lon_mouseX; $Lon_mouseY; $Lon_offsetX; $Lon_offsetY)
		
		SET TIMER:C645(0)
		
		GET MOUSE:C468($Lon_mouseX; $Lon_mouseY; $Lon_button)
		
		If ($Lon_button=1)
			
			If (mouseX>0)
				
				$Lon_offsetX:=0  //$Lon_mouseX-mouseX
				$Lon_offsetY:=$Lon_mouseY-mouseY
				
				OBJECT MOVE:C664(*; obj_resize_target; 0; 0; $Lon_offsetX; $Lon_offsetY)
				OBJECT MOVE:C664(*; "handle."+obj_resize_target; $Lon_offsetX; $Lon_offsetY)
				
				OBJECT MOVE:C664(*; obj_move_target; $Lon_offsetX; $Lon_offsetY)
				OBJECT MOVE:C664(*; "handle."+obj_move_target; $Lon_offsetX; $Lon_offsetY)
				
				mouseX:=$Lon_mouseX
				mouseY:=$Lon_mouseY
				
				REDRAW WINDOW:C456
				
			End if 
			
			SET CURSOR:C469(9002)
			
			SET TIMER:C645(-1)
			
		Else 
			
			mouseX:=-1
			mouseY:=-1
			
			IDLE:C311
			
			SET TIMER:C645(50)
			
		End if 
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily")
		
		
		//______________________________________________________
End case 