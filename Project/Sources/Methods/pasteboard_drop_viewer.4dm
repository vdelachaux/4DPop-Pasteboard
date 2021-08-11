//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method: pasteboard_drop_viewer
// Database: 4DPop Pastboard.4DB
// ID[8928CA9C42C04A7987E5FD032EBD5718]
// Created 19/05/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
// Declarations
C_TEXT:C284($1)

C_LONGINT:C283($Lon_parameters; $Lon_window)
C_TEXT:C284($Txt_entryPoint)

If (False:C215)
	C_TEXT:C284(pasteboard_drop_viewer; $1)
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
		
		Case of 
				
				//……………………………………………………………………
			: (Method called on error:C704=Current method name:C684)
				
				// Error handling manager {
				
				//}
				
				//……………………………………………………………………
			Else 
				
				// This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317("pasteboard_drop_viewer"; 0; "$pasteboard_drop_viewer"; "_run"; *))
				
				//……………………………………………………………………
		End case 
		
		//___________________________________________________________
	: ($Txt_entryPoint="_run")
		
		// First launch of this method executed in a new process
		pasteboard_drop_viewer("_declarations")
		pasteboard_drop_viewer("_init")
		
		//{
		$Lon_window:=Open form window:C675("pasteboard_drop_viewer"; Plain form window:K39:10)
		DIALOG:C40("pasteboard_drop_viewer")
		CLOSE WINDOW:C154
		//}
		
		pasteboard_drop_viewer("_deinit")
		
		//___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		COMPILER_pastboard
		
		//___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		//___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		//___________________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Unknown entry point ("+$Txt_entryPoint+")")
		
		//___________________________________________________________
End case 