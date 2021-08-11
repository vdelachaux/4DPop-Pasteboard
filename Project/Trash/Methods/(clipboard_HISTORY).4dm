//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)

C_LONGINT:C283($bottom; $height; $i; $lButton; $left; $lOffset)
C_LONGINT:C283($mouseX; $mouseY; $right; $top; $width)
C_TEXT:C284($t)

If (False:C215)
	C_TEXT:C284(clipboard_HISTORY; $1)
End if 

C_OBJECT:C1216(clip)

Case of 
		
		//______________________________________________________
	: (Count parameters:C259=0)  // Keep clipboard content
		
		$t:=Get text from pasteboard:C524  // Text?
		
		If (Bool:C1537(OK))\
			 & (Length:C16($t)>0)
			
			If (clip=Null:C1517)  // Empty history
				
				clip:=New object:C1471(\
					"current"; $t; \
					"history"; New collection:C1472($t))
				
			Else 
				
				// Keep current value
				clip.current:=$t
				
				// Search for this text in history
				$i:=clip.history.indexOf($t)
				
				If ($i=-1)
					
					// Put at top
					clip.history.insert(0; $t)
					
				Else 
					
					If ($i>0)  // Found but not the last added
						
						clip.history.remove($i)  // Remove precedent entry
						clip.history.insert(0; $t)
						
					End if 
				End if 
				
				If (clip.ui#Null:C1517)
					
					CALL FORM:C1391(clip.ui; "clipboard_HISTORY"; "refresh")
					
				End if 
			End if 
		End if 
		
		//______________________________________________________
	: ($1="show")  // Display UI
		
		// Not open more than one dialog
		ARRAY LONGINT:C221($tLon_windows; 0x0000)
		WINDOW LIST:C442($tLon_windows; *)
		
		For ($i; 1; Size of array:C274($tLon_windows); 1)
			
			If (Get window title:C450($tLon_windows{$i})="4DPop Clipboard")
				
				// Change window to foreground
				GET WINDOW RECT:C443($left; $top; $right; $bottom; $tLon_windows{$i})
				SET WINDOW RECT:C444($left; $top; $right; $bottom; $tLon_windows{$i})
				
				$i:=MAXLONG:K35:2-1
				
			End if 
		End for 
		
		If ($i#MAXLONG:K35:2)
			
			// Display dialog
			CALL WORKER:C1389(1; "clipboard_HISTORY"; "ui")
			
		End if 
		
		//______________________________________________________
	: ($1="ui")
		
		clipboard_HISTORY("init")
		
		// Get the current clipboard if any
		clipboard_HISTORY
		
		$i:=Open form window:C675("CLIPBOARD_HISTORY"; Palette form window:K39:9; *)
		DIALOG:C40("CLIPBOARD_HISTORY"; *)
		
		//______________________________________________________
	: ($1="init")
		
		If (clip=Null:C1517)
			
			clip:=New object:C1471(\
				"ui"; Null:C1517; \
				"current"; ""; \
				"history"; New collection:C1472)
			
		End if 
		
		// WE CAN'T INSTALL A CALLING EVENT METHOD FROM A COMPONENT
		If (Structure file:C489=Structure file:C489(*))
			
			// Start trapping
			ON EVENT CALL:C190("clipHistory")
			
		End if 
		
		//______________________________________________________
	: ($1="stop")  // Stop trapping
		
		// WE CAN'T UNINSTALL A CALLING EVENT METHOD FROM A COMPONENT
		If (Structure file:C489=Structure file:C489(*))
			
			ON EVENT CALL:C190("")
			
		End if 
		
		//______________________________________________________
	: ($1="refresh")  // Update UI
		
		Form:C1466.history:=clip.history
		
		//______________________________________________________
End case 