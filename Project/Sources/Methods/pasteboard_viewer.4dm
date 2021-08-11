//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method: pasteboard_viewer
// Database: 4DPop Pastboard.4DB
// ID[F6B1BB22297E4FD6837ECF54E153056F]
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
	C_TEXT:C284(pasteboard_viewer; $1)
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
				
				// Error handling manager{
				
				//}
				
				//……………………………………………………………………
			Else 
				
				// This method must be executed in a new process
				BRING TO FRONT:C326(New process:C317("pasteboard_viewer"; 0; "$pasteboard_viewer"; "_run"; *))
				
				//……………………………………………………………………
		End case 
		
		//___________________________________________________________
	: ($Txt_entryPoint="_run")  // Show pastboard explorer
		
		// First launch of this method executed in a new process
		pasteboard_viewer("_declarations")
		pasteboard_viewer("_init")
		
		//{
		
		$Lon_window:=Open form window:C675("pasteboard_viewer"; Plain form window:K39:10; *)
		DIALOG:C40("pasteboard_viewer")
		CLOSE WINDOW:C154
		
		//}
		pasteboard_viewer("_deinit")
		
		//___________________________________________________________
	: ($Txt_entryPoint="dropPastboard")
		
		$Lon_window:=Open form window:C675("pasteboard_viewer"; Movable form dialog box:K39:8; *)
		
		Lst_dataTypes:=pastboard_Get_data_Types
		
		DIALOG:C40("pasteboard_viewer")
		
		CLOSE WINDOW:C154
		
		pasteboard_viewer("_deinit")
		
		//___________________________________________________________
	: ($Txt_entryPoint="_declarations")
		
		COMPILER_pastboard
		
		//___________________________________________________________
	: ($Txt_entryPoint="_init")
		
		Lon_dataSize:=0
		
		//___________________________________________________________
	: ($Txt_entryPoint="_deinit")
		
		CLEAR LIST:C377(Lst_dataTypes; *)
		
		//___________________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Unknown entry point ("+$Txt_entryPoint+")")
		
		//___________________________________________________________
End case 