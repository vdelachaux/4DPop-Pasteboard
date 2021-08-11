//C_ENTIER LONG($Lon_bottom;$Lon_i;$Lon_left;$Lon_right;$Lon_top)
//C_ENTIER LONG($Lon_windowRef)
//
//TABLEAU ENTIER LONG($tLon_windows;0)
//
//LISTE FENETRES($tLon_windows;*)
//
//Boucle ($Lon_i;1;Taille tableau($tLon_windows);1)
//
//Si (Titre fenetre($tLon_windows{$Lon_i})="4DPop Pastboard Viewer")
//
//$tLon_windows{0}:=$tLon_windows{$Lon_i}
//
//$Lon_i:=MAXLONG-1
//
//Fin de si 
//Fin de boucle 
//
//Si ($tLon_windows{0}=0)
//
//COORDONNEES FENETRE($Lon_left;$Lon_top;$Lon_right;$Lon_bottom;Fenetre formulaire courant)
//
//OBJET FIXER ACTIVATION(*;OBJET Lire nom(Objet courant);Faux)
//$Lon_windowRef:=Creer fenetre formulaire("pasteboard_preview";Form fenêtre palette;$Lon_left+60;$Lon_top+60)
//DIALOGUE("pasteboard_preview";*)
//FERMER FENETRE
//
//Sinon 
//
//BEEP
//
//COORDONNEES FENETRE($Lon_left;$Lon_top;$Lon_right;$Lon_bottom;$tLon_windows{0})
//CHANGER COORDONNEES FENETRE($Lon_left;$Lon_top;$Lon_right;$Lon_bottom;$tLon_windows{0})
//
//Fin de si 

SET TIMER:C645(0)

GET WINDOW RECT:C443(gauche; haut; droite; bas; Current form window:C827)
SET WINDOW RECT:C444(gauche; haut; droite+380; bas; Current form window:C827)

SET TIMER:C645(-1)