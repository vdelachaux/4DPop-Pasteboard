//%attributes = {"invisible":true}
C_TEXT:C284($t)

$t:=Get text from pasteboard:C524

If (Bool:C1537(OK))\
 & (Length:C16($t)>0)
	
	If (Storage:C1525.clipboard=Null:C1517)
		
		Use (Storage:C1525)
			
			Storage:C1525.clipboard:=New shared object:C1526(\
				"current"; Null:C1517; \
				"history"; New shared collection:C1527)
			
		End use 
	End if 
	
	//$t:=:=Replace string($t;"\t";"")
	//$t:=Split string($t;"\r";sk trim spaces).join("\r")
	
	Use (Storage:C1525.clipboard)
		
		If (Storage:C1525.clipboard.history.length>0)
			
			If (Storage:C1525.clipboard.history[0]#$t)
				
				Storage:C1525.clipboard.history.insert(0; $t)
				Storage:C1525.clipboard.current:=$t
				
				If (Storage:C1525.clipboard.ui#Null:C1517)
					
					CALL FORM:C1391(Storage:C1525.clipboard.ui; "refresh")
					
				End if 
			End if 
			
		Else 
			
			Storage:C1525.clipboard.history.insert(0; $t)
			Storage:C1525.clipboard.current:=$t
			
			If (Storage:C1525.clipboard.ui#Null:C1517)
				
				CALL FORM:C1391(Storage:C1525.clipboard.ui; "refresh")
				
			End if 
		End if 
	End use 
End if 