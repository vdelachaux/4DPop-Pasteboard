C_LONGINT:C283($Lon_Button)

Case of 
		//______________________________________________________
	: (Form event code:C388=On Clicked:K2:4)
		
		GET MOUSE:C468(mouseX; mouseY; $Lon_Button)
		obj_resize_target:="source.box.@"
		obj_move_target:="target.@"
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: (Form event code:C388=On Mouse Move:K2:35)
		
		SET CURSOR:C469(9002)
		
		//______________________________________________________
	Else 
		//______________________________________________________
End case 