//%attributes = {"invisible":true}
If ((Modifiers ?? Command key bit:K16:2)\
 & (KeyCode=Character code:C91("c")))
	
	CALL WORKER:C1389(1; "readClipBoard")
	
End if 