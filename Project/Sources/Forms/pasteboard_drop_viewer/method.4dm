var $svg; $t : Text

$t:=$t+"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"\
+"<svg xmlns=\"http://www.w3.org/2000/svg\">"\
+"<rect id=\"dropZone\" fill=\"none\" height=\"90\" rx=\"20\" ry=\"20\" stroke=\"darkgray\" stroke-dasharray=\"20,2\" stroke-width=\"3\" width=\"350\" x=\"3\" y=\"3\"/>"\
+"<textArea fill=\"darkgray\" font-family=\""\
+"'"+OBJECT Get font:C1069(*; "")+"'"\
+"\" font-size=\"24\" font-style=\"normal\" font-weight=\"normal\" height=\"40\" text-align=\"center\" text-decoration=\"none\" width=\"350\" x=\"3\" y=\"35\">"\
+Localized string:C991("dropSomethingHere")\
+"</textArea></svg>"

$svg:=DOM Parse XML variable:C720($t)

If (OK=1)
	
	SVG EXPORT TO PICTURE:C1017($svg; (OBJECT Get pointer:C1124(Object named:K67:5; "dropArea"))->)
	DOM CLOSE XML:C722($svg)
	
End if 