C_BLOB:C604($Blb_buffer; $Blb_contener)
C_LONGINT:C283($Lon_i)

ARRAY TEXT:C222($tTxt_4Dsignatures; 0)
ARRAY TEXT:C222($tTxt_formatNames; 0)
ARRAY TEXT:C222($tTxt_nativeTypes; 0)

CLEAR LIST:C377(Lst_dataTypes; *)

Lst_dataTypes:=New list:C375

GET PASTEBOARD DATA TYPE:C958($tTxt_4Dsignatures; $tTxt_nativeTypes; $tTxt_formatNames)

For ($Lon_i; 1; Size of array:C274($tTxt_4Dsignatures); 1)
	
	APPEND TO LIST:C376(Lst_dataTypes; $tTxt_nativeTypes{$Lon_i}; $Lon_i)
	
	SET LIST ITEM PARAMETER:C986(Lst_dataTypes; 0; "4D"; $tTxt_4Dsignatures{$Lon_i})
	SET LIST ITEM PARAMETER:C986(Lst_dataTypes; 0; "native"; $tTxt_nativeTypes{$Lon_i})
	SET LIST ITEM PARAMETER:C986(Lst_dataTypes; 0; "format"; $tTxt_formatNames{$Lon_i})
	
	GET PASTEBOARD DATA:C401($tTxt_nativeTypes{$Lon_i}; $Blb_buffer)
	VARIABLE TO BLOB:C532($Blb_buffer; $Blb_contener; *)
	SET BLOB SIZE:C606($Blb_buffer; 0)
	
End for 

Lon_dataSize:=BLOB size:C605($Blb_contener)

SORT LIST:C391(Lst_dataTypes)

SET TIMER:C645(-1)