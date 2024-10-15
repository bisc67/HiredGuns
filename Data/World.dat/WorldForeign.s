********************************************************************************
********************************************************************************
********************************************************************************
*                                                                              *
*          ##\ ##\##\#####\ ##### #####     #### /## /##/#####  /####          *
*          ## \## ## ##\ ## ##\   ##  ##   ##  ## ##  ## ## /##/##  ##         *
*          ##  ## ## ##  ## ##    ##  ##   ##     ##  ## ##  ## ##             *
*          ###### ## #####  ####  ##  ##   ##     ##  ## ##  ##  ####          *
*          ##  ## ## ##  ## ##    ##  ##   ##  ## ##  ## ##  ##     ##         *
*          ## /## ## ##  ## ##/   ##  ##   ##  ##\##  ## ##  ##\## \##         *
*          ##/ ##/##/##/ ##/##### #####     ##### \#### \## \## \####          *
*                                                                              *
********************************************************************************
*********************** Copyright � Scott Johnston 1990-93 *********************
********************************************************************************

	opt 	o+,ow-

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 1. Ile artificielle.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 1. Ile artificielle construite sur des fondations de~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"d�chets industriels. Dimensions approximatives : 3 x 5 km.~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ATTENTION : source infrarouge 54 m en~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"dessous du niveau de la mer. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 2. R�seau de grottes.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 2. R�seau de grottes. Fissure dans une fa�ade~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"rocheuse (12 m de largeur). Abri possible. T�moignage des~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"premiers colons `-large r�seau de grottes complexes-'. FIN.~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 3. Centre d'essais.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 3. Centre d'essais. Zone haute s�curit� d'essai bio-~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"m�dicaux, de terraformation et d'atmosph�rologie. Risque~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"minimum de contamination. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b    $fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 4. Laboratoire.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 4. Laboratoire. Laboratoire haute s�curit�~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"apparemment sp�cialis� dans la bio-terraformation.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ATTENTION : confirmation d'un d�ploiement ill�gal~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"d'auto-sentinelles AVT-789 sur le site. FIN.~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 5. Raffinerie.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 5. Raffinerie. Ressemble � un cube compos� de~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"conduits et de r�servoirs entour� d'une multitude de~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"v�hicules de transport automatis�s pour distribuer le~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"produit fini dans toute la plan�te. FIN.~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 6. Urbanisation.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 6. Cit� fortifi�e de Ghule. Un vaste d�me la prot�ge~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"du climat hostile et des radiations de fond de Graveyard.~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"De nombreux sas mais un seul est accessible. FIN.~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 7. D�p�t abandonn�.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 7. D�p�t abandonn�. En raison du d�clin du~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"march�, le d�p�t d'�quipements de qualit� de~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"terraformation est d�sormais d�saffect�. FIN.~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 8. Non r�pertori�.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 8. Non r�pertori�. Actuellement aucune information~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"disponible sur le site sp�cifi�. FIN. L'objectif secondaire~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"de la mission stipule que vous partiez en reconnaissance du~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"terrain pour obtenir des informations suppl�mentaire.~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 9. Temple.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 9. Temple d'Horazim. Structure relativement r�cente~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"qui abrite Horazim, fondateur de la religion Duone, ou du~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"moins son principal adepte. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 10. D�p�t de munitions.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 10. D�p�t de munitions. Bunker hautement prot�g�.~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"L'unique voie d'acc�s est dissimul�e dans la roche, � la~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"base de l'affleurement expos� aux intemp�ries. FIN.~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 11. Tour de liaison satellite.~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 11. Tour de liaison satellite. Le principal moyen de~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"communication est situ� au sommet de la montagne pour~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"effectuer des transmissions haute capacit� vers les autres~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"mondes habit�s du syst�me. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 12. Batterie de d�fense.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 12. Batterie de d�fense. Lasers de d�fense~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"plan�taire. Install�s sur la plupart des plan�tes habit�es~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"lors de la derni�re guerre, o� ils se sont r�v�l�s~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"inefficaces. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 13. Zone morte.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AUCUN DANGER~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 14. Temple.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 14. Temple. Appel� M'aziir Diy Allogh, lit�ralement~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Demeure de l'�lu, ce sanctuaire est plus connu sous le nom~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"de Temple de Duone. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 15. Caveau.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 15. Caveau. Cette tombe n'a jamais re�u de nom. Elle~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"a �t� remplie si vite apr�s son ach�vement qu'on a d� en~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"construire une autre. Y reposent essentiellement des~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"victimes de guerre. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 17. Centre des op�rations.~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 17. Centre des op�rations. Comme toutes les plan�tes~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"terraform�es, Graveyard a un centre d'op�rations. Apr�s la~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"suppression de subventions, de tels �tablissements~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"deviennent inutiles. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 18. R�acteur de fusion.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 18. R�acteur de fusion. Actuellement la principale~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"source d'�nergie de la plan�te apr�s l'abandon d'un~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"programme d'�nergie hydro-�lectrique. FIN.~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 19. Usine de d�salement.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 19. Usine de d�salement. Con�ue pour fonctionner~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"encore 40 ans. R�duit de 15 % le taux de sel de l'oc�an~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"oriental de Graveyard. Permet la culture de la vie marine~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"extra-terrestre. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 20. Urbanisation.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 20. Urbanisation. M�galopole en expansion abritant~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"essentiellement des centres administratifs et politiques.~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 21. Spatioport.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 21. Spatioport. La plateforme de lancement est le~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"point d'envol vers le reste du syst�me. Tout le traffic~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"spatial est dirig� vers ce point ou aux antipodes de la~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"plan�te. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** R�SERVE ANIMALE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr��e par D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSION EXIGE QUE TOUS LES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTICIPANTS �VACUENT LA ZONE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** R�ACTEUR ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSION EXIGE QUE TOUS LES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTICIPANTS �VACUENT LA ZONE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** P�NITENCIER ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : I. Dunlop~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSION EXIGE QUE TOUS LES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTICIPANTS �VACUENT LA ZONE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** SURVIVRE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSION EXIGE QUE TOUS LES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTICIPANTS �VACUENT LA ZONE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** JARDIN DE JARRYS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GUERRES DES LEMMINGS - CHAPITRE PREMIER ***~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** G�N�RATEUR ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ASILE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GRUYERE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** FUITE VERS LA MORT ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** BAT MOBILE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : S. Johnston~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTR�E 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"ESTIMATATION DU DANGER : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTR�E 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** BUREAU DE DATATION AU ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"*** CARBONE DE BUCKMINSTER PARK ***~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Cr�ation : G. Anderson. LE PREMIER PARTICIPANT~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"A ATTEINDRE LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRE DE LOISIRS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** SALLE DES SQUELETTES ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRE D'URBANISATION ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GALERIE COMMERCIALE DE GRAVEYARD ***~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GUERRES DES LEMMINGS - CHAPITRE DEUX ***~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Cr�ation : G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONE D'ENTRAINEMENT 1 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONE D'ENTRAINEMENT 2 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONE D'ENTRAINEMENT 3 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONE D'ENTRAINEMENT 4 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONE D'ENTRAINEMENT 5 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LE PREMIER PARTICIPANT A ATTEINDRE~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"LE POINT DE SORTIE L'EMPORTE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 1. K�nstliche Insel.~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 1. Auf Industrieabf�llen erbaute k�nstliche~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Insel.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Fl�che ungef�hr 3 mal 5 km.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"ACHTUNG! Infrarotquelle 54 m unter Meeresspiegel. ENDE.~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 2. H�hlensystem.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 2. H�hlensystem. 12 m breite Spalte in Felswand~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"kann als Unterschlupf dienen. Tageb�cher von Erstsiedlern~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"sprechen von einem massiven und komplexen H�hlensystem. ENDE"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 3. Testlaboranlage.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 3. Testlaboranlage. Hochsicherheitsbereich mit~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"biomedizinischem, erdformendem und~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Betonmantelschichttestbett. Kontaminationsrisiko gering.~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 4. Labor.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 4. Labor. Ein Hochsicherheitslabor,~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"wahrscheinlich f�r Bioerdformung. ACHTUNG! Illegal~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"aufgestellte automatische Wachanlagen AVT-789 wurden~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"best�tigt. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 5. Raffinerie.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 5. Raffinerie. Gro�er W�rfel aus Leitungen und~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Tanks mit ganzen Schw�rmen automatischer Transportmittel,~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"die das Endprodukt �ber den ganzen Planeten verteilen. ENDE."
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 6. St�dtische Siedlung.~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 6. Die geschlossene Stadt von Ghule. Gegen~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Wetter und die h�here Hintergrundstrahlung des Graveyard~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"durch eine gewaltige Kuppel gesch�tzt. Viele Luftschleusen,~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"von denen nur eine zug�nglich ist. ENDE.~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 7. Verlassenes Lager.~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 7. Verlassenes Lager. Wegen der geringen~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Nachfrage nach Qualit�tserdformungsmaschinen steht dieses~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Langzeitlager jetzt leer. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 8. Nicht klassifiziert.~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 8. Nicht klassifiziert. Momentan keine~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Informationen zum angegebenen Ort. ENDE.~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Sekund�res Missionsziel erfordert die Aufkl�rung~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"weiterer Daten zu dieser Anlage.~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 9. Mausoleum.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 9. Mausoleum des Horazim. Vor relativ kurzer~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Zeit f�r Horazim, den Begr�nder bzw. Hauptverfechter der~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Duone-Religion errichtet. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 10. Munitionsdepot.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 10. Munitionsdepot. Ein stark~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"abgesicherter Bunker, dessen einziger~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Zugang in einer Felsspalte liegt. ENDE.~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 11. Satellitenverbindungsturm.~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 11. Satellitenverbindungsturm. Die Haupt-~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"kommunikationsanlage befindet sich hier auf dem h�chsten~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Punkt des Berges, um starke Sendeleistungen zu den anderen~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"bewohnten Welten des Systems erreichen zu k�nnen. ENDE.~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 12. Verteidigungsbatterie.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 12. Verteidigungsbatterie. Mit Planetenverteidi-"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"gungslasern ausgestattet. Wurden auf den meisten bewohnbaren"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Planeten mit Bev�lkerung als Ergebnis des letzten Kriegs~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"installiert, wo sie ihren unsch�tzbaren Wert bewiesen. ENDE.",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 13. Fallzone.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"KEINE BEDROHUNG~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 14. Tempel.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 14. Tempel. Dieses M'aziir Diy Allogh, w�rtlich~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Heimstatt des Auserw�hlten, genannte religi�se Bauwerk ist~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"allgemein als Tempel von Duone bekannt. ENDE.~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 15. Grabmal.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 15. Grabmal. Dieses Grabmal hat keinen Namen.~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Nach seiner Errichtung war es so schnell voll, da� sofort~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ein weiteres begonnen wurde. Haupts�chlich f�r Kriegsopfer.~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 17. Operationszentrum.~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 17. Operationszentrum. Jeder erdf�rmige Planet~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"hat ein Operationszentrum und der Graveyard ist keine~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Ausnahme. Wenn die Finanzierung zur�ckgezogen wird, erweist~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"sich eine solche Anlage h�ufig als nicht notwendig. ENDE.~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 18. Fusionsreaktor.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 18. Fusionsreaktor. Momentan die einzige Strom-~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"versorgung des Planeten, nachdem die Finanzierung eines~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"hydroelektrischen Programms zur�ckgezogen wurde. ENDE.~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 19. Entsalzungsanlage.~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 19. Entsalzungsanlage. Die Anlage reduziert den~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Salzgehalt des �stlichen Ozeans des Graveyard um 15%. Damit~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"wird es m�glich, die Aufzucht von planetenfremden~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"Meerestieren zu betreiben. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 20. St�dtische Siedlung.~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 20. St�dtische Siedlung. Eine ausgedehnte Stadt,"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"die �berwiegend aus administrativen und politischen~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Zentren besteht. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 21. Weltraumhafen.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 21. Weltraumhafen. Die Shuttle-Startanlage ist~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"der Sprungpunkt zum �brigen System. Der gesamte~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Raumfahrtverkehr wird hier geleitet oder zur anderen Seite~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"des Planeten disponiert. ENDE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TIERGEHEGE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"MISSION ERFORDERT; DASS ALLE TEILNEHMER~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DIE ZONE VERLASSEN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** REAKTOR ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"MISSION ERFORDERT; DASS ALLE TEILNEHMER~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DIE ZONE VERLASSEN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZUCHTHAUS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von I. Dunlop~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"MISSION ERFORDERT; DASS ALLE TEILNEHMER~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DIE ZONE VERLASSEN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** �BERLEBEN ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"MISSION ERFORDERT; DASS ALLE TEILNEHMER~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DIE ZONE VERLASSEN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GARTEN VON JARRYS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** LEMMING-KRIEGE - ERSTES KAPITEL ***~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** STROMGENERATOR ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** DIE ANSTALT ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GROSSER K�SE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** FLUCHT IN DEN TOD ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** BAT-MOBIL ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von S. Johnston~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"LOG-EINTRAG 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"GESCH�TZTE BEDROHUNG: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"LOG-EINTRAG 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** BUCKMINSTER PARK RADIOKARBONDATIERUNGSSTELLE ***~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** FREIZEITZENTRUM ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** SKELETTHALLE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ST�DTISCHES SIEDLUNGSZENTRUM ***~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GRAVEYARD-EINKAUSPASSAGE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** LEMMING-KRIEGE - KAPITEL ZWEI ***~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Design von G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TRAININGSZONE 1 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TRAININGSZONE 2 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TRAININGSZONE 3 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TRAININGSZONE 4 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** TRAININGSZONE 5 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ES GEWINNT DER ERSTE TEILNEHMER,~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"DER DEN AUSGANG ERREICHT.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 1. Isola artificiale.~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 1. Isola artificale costruita su zona di~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"scarichi industriali. Dimensioni: circa 3 x 5 km.~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ATTENZIONE: raggi infrarossi a 54 m sotto livello medio del~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"mare. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 2. Complesso di caverne.~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 2. Complesso di caverne. Grande fessura nella~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"roccia (larga 12 m); probabile luogo di rifugio. Primi~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"colonizzatori scrivono di un `intricato groviglio di~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"caverne...'. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 3. Sede di test di laboratorio.~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 3. Sede di test di laboratorio. Area di massima~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"sicurezza, dove vengono svolti test medici, di ingegneria~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"planetaria e controlli meteorologici. Rischio di~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"contaminazione minimo. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 4. Laboratorio.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 4. Laboratorio. Laboratorio di massima sicurezza"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"apparentemente specializzato nella bioterraformazione.~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ATTENZIONE: confermato spiegamento illegale di~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"autosentinelle AVT-789. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 5. Raffineria.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 5. Raffineria. Occupa molto spazio sul suolo e~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"nell'aria. Ha la forma di un cubo composto da tubature e~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"cisterne con molti mezzi di trasporto automatizzato che~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"distribuiscono al pianeta il prodotto finito. FINE.~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 6. Agglomerato urbano.~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 6. Citt� di Ghule. Una grande cupola la protegge"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"dal cattivo tempo e dalle radiazioni di sfondo pi� forti a~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"cui � sottoposto Graveyard. Sui bordi si trovano molte~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"camere di equilibrio; solo una � accessibile. FINE.~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 7. Deposito abbandonato.~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 7. Deposito abbandonato. Il mercato dei~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"macchinari di qualit� per la terraformazione � ormai~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"decaduto, e questo deposito � ormai vuoto. FINE.~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 8. Non riportata.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 8. Non riportata. Informazioni non disponibili~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"al momento sul luogo specificato. FINE.~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"L'obiettivo della missione secondaria implica una~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"ricognizione di questo luogo per ottenere pi� dati.~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 9. Tempio.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 9. Tempio di Horazim. Struttura relativamente~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"recente, ospita Horazim, fondatore (o almeno principale~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"sostenitore) della religione Duona. FINE.~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 10. Deposito di munizioni.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 10. Deposito di munizioni. Bunker super~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"protetto; l'unica entrata � celata nella roccia alla base di"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"un affioramento consunto. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 11. Torre di comunicazione con il satellite.~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 11. Qui si trovano le principali apparecchiature"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"per le comunicazioni, nel punto pi� alto della montagna, da~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"cui si effettuano potenti collegamenti con gli altri mondi~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"abitabili del sistema. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 12. Batteria da difesa.~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 12. Batteria da difesa, con laser per la difesa~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"planetaria, installati in quasi tutti i pianeti abitabili e~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"popolati, all'indomani dell'ultima guerra in cui si~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"dimostrarono indispensabili. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 13. Zona di atterraggio.~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"NESSUNA MINACCIA~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 14. Tempio.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 14. Tempio. Il suo nome � M'aziir Diy Allogh,~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"che significa Dimora degli eletti; questo edificio religioso"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"� pi� conosciuto come Tempio di Duona. FINE.~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 15. Sacrario.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 15. Sacrario. Questa tomba non ha mai ricevuto~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"un nome. E stata riempita cos� rapidamente dopo la~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"costruzione che ne dovettero costruire un'altra. Contiene~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"soprattutto le vittime di guerra. FINE.~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 16.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 17. Centro operativo.~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 17. Centro operativo. Ogni pianeta terraformato~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"dispone di un centro operativo e Graveyard non fa eccezione."
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Dopo il ritiro del programma di costruzione, questo centro �"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"diventato superfluo. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 18. Reattore a fusione.~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 18. Reattore a fusione. Attualmente � l'unica~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"fonte principale di energia del pianeta, dopo il ritiro del~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"programma di costruzione di una centrale idroelettrica.~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 19. Impianto di desalinizzazione.~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 19. Impianto di desalinizzazionen. Questo~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"impianto ridurr� del 15% il contenuto salino dell'oceano~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"orientale di Graveyard, rendendo possibile l'allevamento di~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"creature marine aliene. FINE.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 20. Agglomerato urbano.~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 20. Agglomerato urbano. Citt� estesa, sede~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"soprattutto di attivit� amministrative e politiche. FINE.~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 21. Base di lancio.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 21. Base di lancio. La rampa di lancio della~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"navetta � il punto di partenza verso il resto del sistema.~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Tutto il traffico spaziale � diretto verso questo punto o~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"verso l'altro lato del pianeta. FINE.~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 22.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** RISERVA DI CACCIA ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSIONE RICHIEDE CHE TUTTI I~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTECIPANTI LASCINO LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 24.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** REATTORE NUCLEARE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSIONE RICHIEDE CHE TUTTI I~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTECIPANTI LASCINO LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** PENITENZIARIO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da I. Dunlop~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSIONE RICHIEDE CHE TUTTI I~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTECIPANTI LASCINO LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** SOPRAVVIVENZA ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISSIONE RICHIEDE CHE TUTTI I~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PARTECIPANTI LASCINO LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GIARDINO DI JARRY ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Attenzione al colore rosso!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Progettato da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** LEMMINGUERRE - CAPITOLO PRIMO ***~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRALE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** MANICOMIO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Evita le squadre di sterminio a tutti i costi.~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Progettato da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 32.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** FORMAGGIONE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"E difficile trovare un cibo pi� sano e utile di questo.~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Progettato da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** FUGA PER LA MORTE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** PIPISTRELLILAND ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da S. Johnston~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ANNOTAZIONE 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"MINACCIA PRESUNTA: 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ANNOTAZIONE 36.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** AGENZIA DI DATAZIONE C DEL PARCO DELLE FASCINE ***~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRO DIVERTIMENTI ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** SALA MACABRA ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettata da D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** AGGLOMERATO URBANO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRO COMMERCIALE DI GRAVEYARD ***~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** LEMMINGUERRE - CAPITOLO SECONDO ***~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Progettato da G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA D'ADDESTRAMENTO 1 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA D'ADDESTRAMENTO 2 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA D'ADDESTRAMENTO 3 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA D'ADDESTRAMENTO 4 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA D'ADDESTRAMENTO 5 ****~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"VINCE IL PRIMO CHE RAGGIUNGE L'USCITA.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 1 DEL REGISTRO. Isla Artificial.~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 1 DEL REGISTRO. Isla artificial construida~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"sobre desperdicios industriales. Medidas aproximadas: 3 por~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"5 km. ADVERTENCIA fuente de infrarrojos por debajo del nivel"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"del mar. FIN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 2 DEL REGISTRO. Sistema de cavernas.~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 2 DEL REGISTRO. Importante fisura en la~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"superficie de la roca posible lugar de refugio. Los informes"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"de registro de los primeros pobladores lo representan como~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"un `...sistema de cavernas masivo y complejo...'. FIN.~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 3 DEL REGISTRO. Local de pruebas.~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA: 4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 3 DEL REGISTRO. Local de pruebas de~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"laboratorio. Zona de alta seguridad que dispone de unidad~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"sanitaria, departamento de ingenier�a del planeta y de zonas"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"de prueba de control clim�tico. FIN.~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 4 DEL REGISTRO. Laboratorio.~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 4 DEL REGISTRO. Laboratorio. Laboratorio de~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"alta seguridad especializado en la aclimatizaci�n del~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"planeta. ADVERTENCIA: confirmado el despliegue ilegal de~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"centinelas autom�ticos AVT-789 en este lugar. FIN.~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 5 DEL REGISTRO. Refiner�a.~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA: 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 5 DEL REGISTRO. Refiner�a. Tiene la forma de~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"un cubo compuesto de tuber�as y tanques con un enjambre de~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"medios de transporte automatizados que distribuyen el~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"producto final por el planeta. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 6 DEL REGISTRO. Centro urbano.~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 6 DEL REGISTRO. Ciudad cercada de Ghule.~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Protegida por una gran c�pula contra las inclemencias del~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"tiempo y la radiaci�n del entorno superior~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"de Graveyard. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 7 DEL REGISTRO. Almac�n abandonado.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 7 DEL REGISTRO. Almac�n abandonado.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"La ca�da del mercado de maquinaria de aclimatizaci�n~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"provoc� el desuso de este local de~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"almacenamiento de largo plazo. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 8 DEL REGISTRO. No facilitada~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 8 DEL REGISTRO. En este momento no existe~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"informaci�n sobre el lugar que ha especificado. FIN. El~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"objetivo secundario de la misi�n exigeque se efect�e un~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"reconocimiento del lugar para aportar informaci�n.~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 9 DEL REGISTRO. Templo.~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 9 DEL REGISTRO. Templo de Horazim. Es una~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"estructura relativamente reciente que alberga a Horazim, el~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"fundador de la religi�n Duone, o al menos su principal~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"defensor. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 10 DEL REGISTRO. Almac�n de munici�n.~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA DE DIARIO 10. Almac�n de munici�n. Un b�nker~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"fuertemente protegido, su �nica entrada es un hueco en la~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"roca al pie de un  afloramiento expuesto a la intemperie.~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 11 DEL REGISTRO.Torre de enlace con sat�lite."
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 11 DEL REGISTRO. Aqu� se encuentra~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"el principal n�cleo de comunicaciones, en la parte m�s alta~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"de la monta�a para realizar transmisiones con los otros~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"mundos habitables del sistema. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA DE DIARIO 12. Bater�a de defensa.~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 12 DEL REGISTRO. Relacionado con los l�ser~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"de defensa planetaria. Se instalaron en la mayor�a de los~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"planetas habitables poblados, como consecuencia de la �ltima"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"guerra donde demostraron ser incalculables. FIN.~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 13 DEL REGISTRO. Zona de descenso.~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"NO OFRECE AMENAZA~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 14 DEL REGISTRO. Templo de Duone.~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA DEL REGISTRO. Templo. Llamado M'aziir Diy Allogh,~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"que literalmente significa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Morada de los Elegidos, si bien suele referirse a este~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"edificio religioso con el nombre de Templo de Duone. FIN.~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 15 DEL REGISTRO. Pante�n de tumbas.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 10~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 15 DEL REGISTRO. Pante�n de tumbas. Esta~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"tumba nunca tuvo nombre. Se llen� tan r�pidamente tras su~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"finalizaci�n que se tuvo que empezar otra. Contiene~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"principalmente v�ctimas de guerra. FIN.~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 16 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 16 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 17 DEL REGISTRO. Centro de operaciones.~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 17 DEL REGISTRO. Centro de operaciones. Cada~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"planeta formado de tierra dispone de un centro de~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"operaciones y Graveyard no es una excepci�n. Tras la~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"retirada de fondos tal servicio es a menudo innecesario. FIN",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 18 DEL REGISTRO. Reactor de fusi�n.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 18 DEL REGISTRO. Reactor de fusi�n.~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Actualmente es la �nica fuente de energ�a del planeta tras~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ser retirados los fondos de un programa de energ�a~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"hidroel�ctrica. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 19 DEL REGISTRO. Planta de desalinizaci�n.~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA: 3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 19 DEL REGISTRO. Planta de desalinizaci�n.~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"La instalaci�n reducir�el contenido de sal del oc�ano~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"situado al este de Graveyard en un 15%. As� se podr�criar~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"fauna marina extraterrestre. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 20 DEL REGISTRO. Centro urbano.~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 9~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 20 DEL REGISTRO. Centro urbano. Una gran~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"ciudad en expansi�n, formada principalmente por centros~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"pol�ticos y administrativos. FIN.~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 21 DEL REGISTRO. Puerto espacial.~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 15~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 21 DEL REGISTRO. Puerto espacial. La pista de"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"lanzamiento de la bah�a trasnmutadora es el punto de partida"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"para el resto del sistema. Todo tr�fico de naves se centra~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"aqu�, o se encamina al otro lado del planeta. FIN.~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"ENTRADA NUMERO 22 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"AMENAZA ESTIMADA : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 22 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** RESERVA ZOOLOGICA ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISION SOLICITA A TODOS LOS PARTICIPANTES~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"QUE EVACUEN LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 24 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"AMENAZA ESTIMADA : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ENTRADA NUMERO 24 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** REACTOR ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISION SOLICITA A TODOS LOS PARTICIPANTES~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"QUE EVACUEN LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** PENITENCIARIA ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de I. Dunlop~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISION SOLICITA A TODOS LOS PARTICIPANTES~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"QUE EVACUEN LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** PERMANECER VIVO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"LA MISION SOLICITA A TODOS LOS PARTICIPANTES~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"QUE EVACUEN LA ZONA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** JARDIN DE JARRYS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GUERRAS DE LEMMING - PRIMER CAPITULO ***~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GENERADOR DE CORRIENTE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** EL MANICOMIO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 32 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"AMENAZA ESTIMADA : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ENTRADA NUMERO 32 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GRAN QUESO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** HUIDA A LA MUERTE ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o se M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** MURCI�LAGOS MOVILES ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de S. Johnston~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"ENTRADA NUMERO 36 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"AMENAZA ESTIMADA : 0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"ENTRADA NUMERO 36 DEL REGISTRO.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** AGENCIA DE CONTACTOS DE CARBONO ***~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"*** DEL PARQUE BUCKMINSTER ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"Dise�o de G. Anderson. EL PRIMER PARTICIPANTE~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"QUE ALCANCE EL PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRO RECREATIVO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** EDIFICIO DE ESQUELETOS ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de D. Hally~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRO URBANO ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de S. Hammond~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** CENTRO COMERCIAL DE GRAVEYARD ***~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de M. Good~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** GUERRAS DE LEMMING - CAPITULO DOS ***~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"Dise�o de G. Anderson~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA DE ENTRENAMIENTO 1 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA DE ENTRENAMIENTO 2 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA DE ENTRENAMIENTO 3 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA DE ENTRENAMIENTO 4 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

	dc.b	$fb,$00,$3c,$00,$0f,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$19,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$0a,$00,$03,$fc,"*** ZONA DE ENTRENAMIENTO 5 ***~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$0c,$fc,"EL PRIMER PARTICIPANTE QUE ALCANCE EL~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$15,$fc,"PUNTO DE SALIDA, GANA.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	dc.b	$fb,$00,$3c,$00,$1e,$fc,"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0

        end
