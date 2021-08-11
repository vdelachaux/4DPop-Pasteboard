C_OBJECT:C1216($e)

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Double Clicked:K2:5)
		
		Use (Storage:C1525.clipboard)
			
			Storage:C1525.clipboard.current:=Form:C1466.history[Form:C1466.position-1]
			Storage:C1525.clipboard.history.insert(0; Storage:C1525.clipboard.current)
			Storage:C1525.clipboard.history.remove(Form:C1466.position)
			
			Form:C1466.history.insert(0; Storage:C1525.clipboard.current)
			Form:C1466.history.remove(Form:C1466.position)
			
			SET TEXT TO PASTEBOARD:C523(Storage:C1525.clipboard.current)
			INVOKE ACTION:C1439(ak paste:K76:55)
			
		End use 
		
		//______________________________________________________
	: ($e.code=On Begin Drag Over:K2:44)
		
		
		
		//______________________________________________________
	Else 
		
		// A "Case of" statement should never omit "Else"
		//______________________________________________________
End case 