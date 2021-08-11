C_LONGINT:C283($0)

C_LONGINT:C283($Lon_window; $Lon_buffer)
C_TEXT:C284($Txt_buffer)

$0:=0

Case of 
		
		//________________________________________
	: (Form event code:C388=On Drag Over:K2:13)
		
		// Animation
		SVG GET ATTRIBUTE:C1056(*; "dropArea"; "dropZone"; "stroke-dasharray"; $Txt_buffer)
		
		$Lon_buffer:=Num:C11(Substring:C12($Txt_buffer; 1; Position:C15(","; $Txt_buffer)-1))
		$Txt_buffer:=String:C10(Choose:C955($Lon_buffer<=0; 20; $Lon_buffer-5))+",2,20,2"
		
		SVG SET ATTRIBUTE:C1055(*; "dropArea"; "dropZone"; \
			"stroke-dasharray"; $Txt_buffer)
		
		//________________________________________
	: (Form event code:C388=On Drop:K2:12)
		
		$Lon_window:=Current form window:C827
		
		HIDE WINDOW:C436($Lon_window)
		
		pasteboard_viewer("dropPastboard")
		
		SHOW WINDOW:C435($Lon_window)
		
		//________________________________________
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		SVG SET ATTRIBUTE:C1055(*; "dropArea"; "dropZone"; \
			"stroke-dasharray"; "20,2")
		
		//________________________________________
End case 