//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method: pasteboard_HISTORY
// Database: studio.4DB
// ID[442171A701AB497890C314BF95634460]
// Created 03/03/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// History is a clipboard manager and history component.
// It keeps a list of text you have copied to the clipboard and allows you
// to paste it again by selecting it from the list.
// ----------------------------------------------------
// Declarations
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters; $Lon_process; $Lon_windowRef)
C_TEXT:C284($Txt_buffer; $Txt_entryPoint; $Txt_method)

If (False:C215)
	C_TEXT:C284(pasteboard_HISTORY; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If ($Lon_parameters>=1)
	
	$Txt_entryPoint:=$1
	
End if 

// ----------------------------------------------------
Case of 
		
		//___________________________________________________________
	: (Length:C16($Txt_entryPoint)=0)
		
		$Txt_method:=Current method name:C684
		
		Case of 
				
				//……………………………………………………………………
			: (Method called on error:C704=$Txt_method)
				
				// Error handling manager
				
				//……………………………………………………………………
			Else 
				
				// This method must be executed in a new process
				$Lon_process:=New process:C317($Txt_method; 0; "$Clipboard_History_Demon"; "_run"; *)
				pasteboard_HISTORY("show")
				
				//……………………………………………………………………
		End case 
		
		//___________________________________________________________
	: ($Txt_entryPoint="show")
		
		BRING TO FRONT:C326(New process:C317(Current method name:C684; 0; "$Clipboard_History_List"; "_show"; *))
		
		//___________________________________________________________
	: ($Txt_entryPoint="_show")
		
		$Lon_windowRef:=Open form window:C675("pasteboard_HISTORY"; Plain form window:K39:10; *)
		DIALOG:C40("pasteboard_HISTORY")
		CLOSE WINDOW:C154
		
		//___________________________________________________________
	: ($Txt_entryPoint="_run")
		
		// First launch of this method executed in a new process
		pasteboard_HISTORY("_declarations")
		
		If (Not:C34(<>Boo_pastboardHistoryRun))
			
			pasteboard_HISTORY("_init")
			
		End if 
		
		$Lon_process:=Current process:C322
		
		//{
		
		Repeat 
			
			DELAY PROCESS:C323($Lon_process; 50)
			
			$Txt_buffer:=Get text from pasteboard:C524
			
			If (OK=1)
				
				If (Length:C16($Txt_buffer)>0)
					
					If ($Txt_buffer#<>tTxt_pastboards{0})
						
						INSERT IN ARRAY:C227(<>tTxt_pastboards; 1; 1)
						<>tTxt_pastboards{1}:=$Txt_buffer
						<>tTxt_pastboards{0}:=$Txt_buffer
						<>tTxt_pastboardsTips:=$Txt_buffer
						
						If (<>tTxt_pastboards>0)
							
							<>tTxt_pastboards:=<>tTxt_pastboards+1
							
						End if 
						
						APPEND TO ARRAY:C911(<>tPic_pastboards; <>tPic_pastboards{0})
						
					End if 
				End if 
			End if 
		Until (Process aborted:C672 | Not:C34(<>Boo_pastboardHistoryRun))
		//}
		
		pasteboard_HISTORY("_deinit")
		
		//___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		COMPILER_pastboard
		
		//___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		<>Boo_pastboardHistoryRun:=True:C214
		
		CLEAR VARIABLE:C89(<>tTxt_pastboards)
		CLEAR VARIABLE:C89(<>tPic_pastboards)
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"images"+Folder separator:K24:12+"clip.png"; <>tPic_pastboards{0})
		
		//___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		CLEAR VARIABLE:C89(<>tTxt_pastboards)
		CLEAR VARIABLE:C89(<>tPic_pastboards)
		
		//___________________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Unknown entry point ("+$Txt_entryPoint+")")
		
		//___________________________________________________________
End case 