// ----------------------------------------------------
// Object method : pasteboard_viewer.type.lst - (4DPop Pasteboard)
// ID[4AD6A3D5187E4680ACE9F07BA972DBEF]
// Created #15-11-2018 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_; $Lon_column; $Lon_formEvent; $Lon_ref; $Lon_row; $Lon_x)
C_LONGINT:C283($Lon_y)
C_TEXT:C284($Txt_4D; $Txt_format; $Txt_label; $Txt_me; $Txt_native; $Txt_tip)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388
$Txt_me:=OBJECT Get name:C1087(Object current:K67:2)

// ----------------------------------------------------
Case of 
		
		//______________________________________________________
	: ($Lon_formEvent=On Mouse Enter:K2:33)
		
		SET DATABASE PARAMETER:C642(Tips enabled:K37:79; 1)
		SET DATABASE PARAMETER:C642(Tips duration:K37:81; 1)
		
		//______________________________________________________
	: ($Lon_formEvent=On Mouse Move:K2:35)
		
		If (Is Windows:C1573)
			
			GET MOUSE:C468($Lon_x; $Lon_y; $Lon_)
			
			LISTBOX GET CELL POSITION:C971(*; $Txt_me; $Lon_x; $Lon_y; $Lon_column; $Lon_row)
			
			If ($Lon_row#0)
				
				GET LIST ITEM:C378(*; $Txt_me; $Lon_row; $Lon_ref; $Txt_label)
				
				GET LIST ITEM PARAMETER:C985(*; $Txt_me; $Lon_ref; "4D"; $Txt_4D)
				SET LIST ITEM PARAMETER:C986(*; $Txt_me; $Lon_ref; "native"; $Txt_native)
				SET LIST ITEM PARAMETER:C986(*; $Txt_me; $Lon_ref; "format"; $Txt_format)
				
				$Txt_tip:="4D: "+$Txt_4D+"\r"\
					+"native: "+$Txt_4D
				
				$Txt_tip:=$Txt_tip+"\r"+"Format: "+$Txt_format
				
			Else 
				
				$Txt_tip:=Get localized string:C991("tips_dataType")
				
			End if 
			
			OBJECT SET HELP TIP:C1181(*; $Txt_me; $Txt_tip)
			
		End if 
		
		//______________________________________________________
	: ($Lon_formEvent=On Mouse Leave:K2:34)
		
		SET DATABASE PARAMETER:C642(Tips duration:K37:81; 45)
		
		//______________________________________________________
	: ($Lon_formEvent=On Selection Change:K2:29)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily ("+String:C10($Lon_formEvent)+")")
		
		//______________________________________________________
End case 