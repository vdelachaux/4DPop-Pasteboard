C_LONGINT:C283($l)
C_OBJECT:C1216($e)

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Clicked:K2:4)
		
		GET MOUSE:C468(MOUSEX; MOUSEY; $l)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Mouse Move:K2:35)
		
		SET CURSOR:C469(9002)
		
		//______________________________________________________
End case 