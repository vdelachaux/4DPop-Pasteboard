//%attributes = {"invisible":true}
C_LONGINT:C283($l)
C_TEXT:C284($t)

If (MODIFIERS ?? Command key bit:K16:2)\
 & (KEYCODE=Character code:C91("c"))
	
	PROCESS PROPERTIES:C336(Frontmost process:C327(*); $t; $l; $l; $l; $l; $l)
	
	If ($l=Design process:K36:9)
		
		CALL WORKER:C1389(1; "clipboard_HISTORY")
		
	End if 
End if 