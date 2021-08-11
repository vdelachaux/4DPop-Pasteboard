C_OBJECT:C1216($e)

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Double Clicked:K2:5)
		
		clip.current:=Form:C1466.selected[0]
		clip.history.insert(0; clip.current)
		clip.history.remove(Form:C1466.position)
		
		Form:C1466.history.insert(0; clip.current)
		Form:C1466.history.remove(Form:C1466.position)
		
		SET TEXT TO PASTEBOARD:C523(clip.current)
		INVOKE ACTION:C1439(ak paste:K76:55)
		
		//______________________________________________________
	: ($e.code=On Begin Drag Over:K2:44)
		
		SET TEXT TO PASTEBOARD:C523(Form:C1466.selected[0])
		//______________________________________________________
End case 