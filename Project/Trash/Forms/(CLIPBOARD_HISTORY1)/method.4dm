// ----------------------------------------------------
// Form method : CLIPBOARD_HISTORY
// ID[8E2AD99C8A6A45259963D20E3D192CF1]
// Created 22-5-2020 by Vincent de Lachaux
// ----------------------------------------------------
C_LONGINT:C283($bottom; $lButton; $left; $mouseX; $mouseY; $offset)
C_LONGINT:C283($right; $top)
C_TEXT:C284($t)
C_OBJECT:C1216($event)

// ----------------------------------------------------
// Initialisations
$event:=FORM Event:C1606

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($event.code=On Load:K2:1)
		
		Form:C1466.history:=New collection:C1472
		
		Use (Storage:C1525.clipboard)
			
			Storage:C1525.clipboard.window:=Current form window:C827
			
			For each ($t; Storage:C1525.clipboard.history)
				
				Form:C1466.history.push($t)
				
			End for each 
		End use 
		
		OBJECT SET SCROLLBAR:C843(*; "history"; 0; 2)
		
		//______________________________________________________
	: ($event.code=On Activate:K2:9)
		
		CALL WORKER:C1389(1; "CLIPBOARD_HISTORY"; "store")
		
		//______________________________________________________
	: ($event.code=On Unload:K2:2)
		
		Use (Storage:C1525.clipboard)
			
			Storage:C1525.clipboard.window:=Null:C1517
			
		End use 
		
		//______________________________________________________
	: ($event.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		GET MOUSE:C468($mouseX; $mouseY; $lButton)
		
		If ($lButton=1)
			
			If (MOUSEX>0)
				
				SET CURSOR:C469(9002)
				
				$offset:=$mouseY-MOUSEY
				
				OBJECT GET COORDINATES:C663(*; "historyTop"; $left; $top; $right; $bottom)
				OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
				
				If (($top+$offset)>54) & (($top+$offset)<($height-40))  // Top limit
					
					// Move & resize
					OBJECT MOVE:C664(*; "current@"; 0; 0; 0; $offset)
					OBJECT MOVE:C664(*; "history"; 0; $offset; 0; -$offset)
					
					// Move
					OBJECT MOVE:C664(*; "handle@"; 0; $offset)
					OBJECT MOVE:C664(*; "historyTop"; 0; $offset)
					
					MOUSEX:=$mouseX
					MOUSEY:=$mouseY
					
				End if 
			End if 
			
			SET TIMER:C645(-1)
			
		Else 
			
			MOUSEX:=-1
			MOUSEY:=-1
			
			IDLE:C311
			
			SET TIMER:C645(0)
			
		End if 
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily ("+$event.description+")")
		
		//______________________________________________________
End case 