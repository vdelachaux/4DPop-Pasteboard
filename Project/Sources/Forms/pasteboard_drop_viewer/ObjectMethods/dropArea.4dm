var $0 : Integer

$0:=0

Case of 
		
		// ________________________________________
	: (Form event code:C388=On Drag Over:K2:13)
		
		// Animation
		var $t : Text
		SVG GET ATTRIBUTE:C1056(*; "dropArea"; "dropZone"; "stroke-dasharray"; $t)
		
		var $dash : Integer:=Num:C11(Substring:C12($t; 1; Position:C15(","; $t)-1))
		$t:=String:C10($dash<=0 ? 20 : $dash-5)+",2,20,2"
		
		SVG SET ATTRIBUTE:C1055(*; "dropArea"; "dropZone"; \
			"stroke-dasharray"; $t)
		
		// ________________________________________
	: (Form event code:C388=On Drop:K2:12)
		
		var $winRef:=Current form window:C827
		
		HIDE WINDOW:C436($winRef)
		
		pasteboard_viewer("dropPastboard")
		
		SHOW WINDOW:C435($winRef)
		
		// ________________________________________
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		SVG SET ATTRIBUTE:C1055(*; "dropArea"; "dropZone"; \
			"stroke-dasharray"; "20,2")
		
		// ________________________________________
End case 