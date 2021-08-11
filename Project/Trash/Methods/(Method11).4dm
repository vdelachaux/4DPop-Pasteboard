//%attributes = {"invisible":true}

$sourceText:="[table]champ"
ARRAY LONGINT:C221($rxPositions; 0)
ARRAY LONGINT:C221($rxLengths; 0)
$rxPattern:="(?mi-s)^(\\[[^[:digit:]][[:alnum:]_]*\\])([^[:digit:]][[:alnum:]_]*)$"
$rxMatch:=Match regex:C1019($rxPattern; $sourceText; 1; $rxPositions; $rxLengths)