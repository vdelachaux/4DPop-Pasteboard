// ----------------------------------------------------
// Form method : pasteboard_viewer
// Created 07/02/11 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_BLOB:C604($Blb_buffer; $Blb_contener)
C_BOOLEAN:C305($Boo_OK)
C_LONGINT:C283($Lon_formEvent; $Lon_i; $Lon_reference)
C_POINTER:C301($Ptr_pictContent; $Ptr_textContent)
C_TEXT:C284($Txt_4Dsignatures; $Txt_buffer; $Txt_formatNames; $Txt_nativeTypes)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------
Case of 
		
		//______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		COMPILER_pasteboard
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "cb.auto-update"))->:=1
		
		If (Window kind:C445(Current form window:C827)=Regular window:K27:1)
			
			OBJECT SET ENABLED:C1123(*; "b.refresh"; False:C215)
			
		Else 
			
			SET WINDOW TITLE:C213(Get localized string:C991("dd_windowTitle"))
			OBJECT SET ENABLED:C1123(*; "cb.auto-update"; False:C215)
			OBJECT SET ENABLED:C1123(*; "b.refresh"; False:C215)
			
		End if 
		
		Obj_CENTER("none"; "pastboard.txt")
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		OBJECT SET VISIBLE:C603(*; "pastboard.@"; False:C215)
		
		If (Is a list:C621(Lst_dataTypes))
			
			// Display, if we can, the content of the selected data type
			$Lon_reference:=Selected list items:C379(Lst_dataTypes; *)
			$Ptr_textContent:=OBJECT Get pointer:C1124(Object named:K67:5; "pastboard.txt")
			$Ptr_pictContent:=OBJECT Get pointer:C1124(Object named:K67:5; "pastboard.pict")
			
			CLEAR VARIABLE:C89($Ptr_textContent->)
			
			If ($Lon_reference#0)
				
				GET LIST ITEM PARAMETER:C985(Lst_dataTypes; $Lon_reference; "4D"; $Txt_4Dsignatures)
				GET LIST ITEM PARAMETER:C985(Lst_dataTypes; $Lon_reference; "native"; $Txt_nativeTypes)
				GET LIST ITEM PARAMETER:C985(Lst_dataTypes; $Lon_reference; "format"; $Txt_formatNames)
				
				If (Shift down:C543)
					
					GET PASTEBOARD DATA:C401($Txt_nativeTypes; $Blb_buffer)
					
					If (OK=1)
						
						$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-8")
						
						If (OK=0)
							
							$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-16")
							
						End if 
					End if 
					
					OBJECT SET VISIBLE:C603(*; "@.txt"; OK=1)
					
				Else 
					
					If ($Txt_nativeTypes="public.file-url")
						
						Repeat 
							
							$Lon_i:=$Lon_i+1
							$Txt_buffer:=Get file from pasteboard:C976($Lon_i)
							
							$Boo_OK:=(Length:C16($Txt_buffer)>0)
							
							If ($Boo_OK)
								
								$Ptr_textContent->:=$Ptr_textContent->+$Txt_buffer+"\r"
								
							End if 
						Until (Not:C34($Boo_OK))
					End if 
					
					Case of 
							
							//…………………………………………………………………………
						: (Length:C16($Ptr_textContent->)>0)
							
							OBJECT SET VISIBLE:C603(*; "@.txt"; True:C214)
							
							//…………………………………………………………………………
						: ($Txt_nativeTypes="dyn.@")
							
							GET PASTEBOARD DATA:C401($Txt_nativeTypes; $Blb_buffer)
							
							If (OK=1)
								
								$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-8")
								
							End if 
							
							OBJECT SET VISIBLE:C603(*; "@.txt"; OK=1)
							
							//…………………………………………………………………………
						: ($Txt_nativeTypes="public.url@")\
							 | ($Txt_nativeTypes="public.utf8-@")\
							 | ($Txt_nativeTypes="public.utf16-@")\
							 | ($Txt_nativeTypes="com.apple.traditional-mac-plain-text")
							
							Repeat 
								
								$Lon_i:=$Lon_i+1
								$Txt_buffer:=Get file from pasteboard:C976($Lon_i)
								
								$Boo_OK:=(Length:C16($Txt_buffer)>0)
								
								If ($Boo_OK)
									
									$Ptr_textContent->:=$Ptr_textContent->+$Txt_buffer+"\r"
									
								End if 
							Until (Not:C34($Boo_OK))
							
							If (Length:C16($Ptr_textContent->)>0)
								
								OBJECT SET VISIBLE:C603(*; "@.txt"; True:C214)
								
							Else 
								
								$Ptr_textContent->:=Get text from pasteboard:C524
								OBJECT SET VISIBLE:C603(*; "@.txt"; OK=1)
								
							End if 
							
							//…………………………………………………………………………
						: ($Txt_nativeTypes="public.rtf")
							
							GET PASTEBOARD DATA:C401($Txt_nativeTypes; $Blb_buffer)
							
							If (OK=1)
								
								$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-8")
								OBJECT SET VISIBLE:C603(*; "@.txt"; True:C214)
								
							End if 
							
							//…………………………………………………………………………
						: ($Txt_nativeTypes="com.apple.webarchive")\
							 | ($Txt_nativeTypes="com.apple.flat-rtfd")\
							 | ($Txt_nativeTypes="com.4d.private@")\
							 | ($Txt_nativeTypes="@.pasteboard.promised@")
							
							// Unreadable types
							
							//…………………………………………………………………………
						Else 
							
							ON ERR CALL:C155("noError")
							
							GET PICTURE FROM PASTEBOARD:C522($Ptr_pictContent->)
							
							If (OK=1)
								
								OBJECT SET VISIBLE:C603(*; "@.pict"; True:C214)
								
							Else 
								
								$Ptr_textContent->:=Get text from pasteboard:C524
								
								If (OK=1)
									
									OBJECT SET VISIBLE:C603(*; "@.txt"; True:C214)
									
								Else 
									
									GET PASTEBOARD DATA:C401($Txt_nativeTypes; $Blb_buffer)
									
									If (OK=1)
										
										$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-8")
										
										If (OK=0)
											
											$Ptr_textContent->:=Convert to text:C1012($Blb_buffer; "UTF-16")
											
										End if 
									End if 
									
									If (Length:C16($Ptr_textContent->)=0)
										
										$Ptr_textContent->:=BLOB to text:C555($Blb_buffer; UTF8 C string:K22:15)
										
										If (Length:C16($Ptr_textContent->)=0)
											
											$Ptr_textContent->:=BLOB to text:C555($Blb_buffer; UTF8 text with length:K22:16)
											
											If (Length:C16($Ptr_textContent->)=0)
												
												$Ptr_textContent->:=BLOB to text:C555($Blb_buffer; UTF8 text without length:K22:17)
												
											End if 
										End if 
									End if 
									
									If (OK=0)
										
										OK:=Num:C11(Length:C16($Ptr_textContent->)>0)
										
									End if 
									
									OBJECT SET VISIBLE:C603(*; "@.txt"; OK=1)
									
								End if 
							End if 
							
							ON ERR CALL:C155("")
							
							//…………………………………………………………………………
					End case 
				End if 
			End if 
		End if 
		
		//______________________________________________________
	: ($Lon_formEvent=On Activate:K2:9)
		
		If ((OBJECT Get pointer:C1124(Object named:K67:5; "cb.auto-update"))->=1)  // Auto-update
			
			ARRAY TEXT:C222($tTxt_4Dsignatures; 0x0000)
			ARRAY TEXT:C222($tTxt_formatNames; 0x0000)
			ARRAY TEXT:C222($tTxt_nativeTypes; 0x0000)
			
			GET PASTEBOARD DATA TYPE:C958($tTxt_4Dsignatures; $tTxt_nativeTypes; $tTxt_formatNames)
			
			For ($Lon_i; 1; Size of array:C274($tTxt_4Dsignatures); 1)
				
				GET PASTEBOARD DATA:C401($tTxt_nativeTypes{$Lon_i}; $Blb_buffer)
				VARIABLE TO BLOB:C532($Blb_buffer; $Blb_contener; *)
				SET BLOB SIZE:C606($Blb_buffer; 0)
				
			End for 
			
			If (BLOB size:C605($Blb_contener)#Lon_dataSize)
				
				// Reload teh pastboard data types
				CLEAR LIST:C377(Lst_dataTypes; *)
				
				Lst_dataTypes:=pastboard_Get_data_Types
				Lon_dataSize:=BLOB size:C605($Blb_contener)
				
				SET TIMER:C645(-1)
				
			End if 
			
			SET BLOB SIZE:C606($Blb_contener; 0)
			
		End if 
		
		//______________________________________________________
	: ($Lon_formEvent=On Resize:K2:27)
		
		Obj_CENTER("none"; "pastboard.txt")
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessarily")
		
		//______________________________________________________
End case 