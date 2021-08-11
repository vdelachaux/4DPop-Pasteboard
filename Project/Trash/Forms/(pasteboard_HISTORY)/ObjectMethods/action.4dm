C_LONGINT:C283($Lon_w; $Lon_x)
C_TEXT:C284($Mnu_choice; $Mnu_main)

$Mnu_main:=Create menu:C408

//AJOUTER LIGNE MENU($Mnu_main;"About 4DPop Pastboard")
//FIXER PARAMETRE LIGNE MENU($Mnu_main;-1;"about")
//
//AJOUTER LIGNE MENU($Mnu_main;"-")

APPEND MENU ITEM:C411($Mnu_main; "Preferences…")
SET MENU ITEM PARAMETER:C1004($Mnu_main; -1; "preferences")

APPEND MENU ITEM:C411($Mnu_main; "-")

APPEND MENU ITEM:C411($Mnu_main; "Show current clipping")
SET MENU ITEM PARAMETER:C1004($Mnu_main; -1; "showCurrentClipping")

APPEND MENU ITEM:C411($Mnu_main; "-")

APPEND MENU ITEM:C411($Mnu_main; "Remove selected clipping…")
SET MENU ITEM PARAMETER:C1004($Mnu_main; -1; "removeSelectedClipping")
If (<>tTxt_pastboards=0)
	
	DISABLE MENU ITEM:C150($Mnu_main; -1)
	
End if 

APPEND MENU ITEM:C411($Mnu_main; "Remove all clippings…")
SET MENU ITEM PARAMETER:C1004($Mnu_main; -1; "removeAllClippings")
If (Size of array:C274(<>tTxt_pastboards)=0)
	
	DISABLE MENU ITEM:C150($Mnu_main; -1)
	
End if 

//AJOUTER LIGNE MENU($Mnu_main;"-")
//
//AJOUTER LIGNE MENU($Mnu_main;"Quit 4DPop Pastboard")
//FIXER PARAMETRE LIGNE MENU($Mnu_main;-1;"quit")

$Mnu_choice:=Dynamic pop up menu:C1006($Mnu_main)
RELEASE MENU:C978($Mnu_main)

Case of 
		//………………………………………………………………………………………
	: (Length:C16($Mnu_choice)=0)
		
		//………………………………………………………………………………………
	: ($Mnu_choice="preferences")
		
		$Lon_w:=Open form window:C675("pasteboard_HISTORY_preferences"; Sheet form window:K39:12)
		DIALOG:C40("pasteboard_HISTORY_preferences")
		CLOSE WINDOW:C154
		
		//………………………………………………………………………………………
	: ($Mnu_choice="showCurrentClipping")
		
		$Lon_x:=Find in array:C230(<>tTxt_pastboards; <>tTxt_pastboards{0})
		If ($Lon_x>0)
			
			<>tTxt_pastboards:=$Lon_x
			LISTBOX SELECT ROW:C912(*; "target.listbox"; <>tTxt_pastboards; lk replace selection:K53:1)
			OBJECT SET SCROLL POSITION:C906(*; "target.listbox"; <>tTxt_pastboards; *)
			
		Else 
			
			BEEP:C151
			
		End if 
		
		//………………………………………………………………………………………
	: ($Mnu_choice="removeSelectedClipping")
		
		CONFIRM:C162("Are you sure you want to remove the selected clipping?"; "Remove"; "Don't Remove")
		
		If (OK=1)
			
			DELETE FROM ARRAY:C228(<>tTxt_pastboards; <>tTxt_pastboards; 1)
			DELETE FROM ARRAY:C228(<>tPic_pastboards; 1; 1)
			
		End if 
		
		//………………………………………………………………………………………
	: ($Mnu_choice="removeAllClippings")
		
		CONFIRM:C162("Are you sure you want to remove all clippings?"; "Remove"; "Don't Remove")
		
		If (OK=1)
			
			DELETE FROM ARRAY:C228(<>tTxt_pastboards; 1; Size of array:C274(<>tTxt_pastboards))
			CLEAR VARIABLE:C89(<>tTxt_pastboards{0})
			
			DELETE FROM ARRAY:C228(<>tPic_pastboards; 1; Size of array:C274(<>tPic_pastboards))
			
			SET TIMER:C645(-1)
			
		End if 
		
		//………………………………………………………………………………………
	Else 
		
		ASSERT:C1129(False:C215; "Unknown menu action ("+$Mnu_choice+")")
		
		//………………………………………………………………………………………
End case 