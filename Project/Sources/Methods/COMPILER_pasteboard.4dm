//%attributes = {"invisible":true}
C_LONGINT:C283(Lst_dataTypes; Lon_dataSize)

C_BOOLEAN:C305(<>Boo_pastboardHistoryRun)
C_TEXT:C284(<>tTxt_pastboardsTips)

//%W-518.7
If (Undefined:C82(<>tTxt_pastboards))
	
	ARRAY TEXT:C222(<>tTxt_pastboards; 0)
	ARRAY PICTURE:C279(<>tPic_pastboards; 0)
	
End if 

If (False:C215)  // <public>
	
	// ----------------------------------------------------
	C_POINTER:C301(dragAndDropExplorer; $1)
	
	// ----------------------------------------------------
	C_POINTER:C301(pasteboardExplorer; $1)
	
	// ----------------------------------------------------
End if   // </public>

If (False:C215)  // <private>
	
	// ----------------------------------------------------
	C_LONGINT:C283(pastboard_Get_data_Types; $0)
	
	// ----------------------------------------------------
	C_TEXT:C284(pasteboard_drop_viewer; $1)
	
	// ----------------------------------------------------
	C_TEXT:C284(pasteboard_viewer; $1)
	
	// ----------------------------------------------------
End if   // </private>