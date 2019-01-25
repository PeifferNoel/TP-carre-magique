program Carre_majik_proc;
//But: Afficher un carre magique de 5x5 ou 7x7 mais avec des procedures
//Entree: /
//Sortie: Le carre magique

uses crt;

CONST
	taille = 5; //La taille du Tableau, changeable

TYPE tableau = array[1..taille, 1..taille] OF INTEGER;

VAR     T:tableau;
	nb, i, j, previ, prevj: INTEGER;


	//================================INITIALISATION DU TABLEAU ET DE LA POSITION================================//
PROCEDURE ini;
begin
	nb := 0;
	i:=(taille div 2);
	j:=(taille div 2)+1;
end;

	//================================ON AFFICHE LE TABLEAU================================//
PROCEDURE aff (var T: tableau);
begin
	FOR i:=1 TO taille DO
	begin
		FOR j:=1 TO taille DO
		begin
			write('|');
			write(T[i,j]:2);
		end;
		write('|');
		writeln();
	end;
    readln();
end;
	//================================ON REMPLIT LE TABLEAU================================//

BEGIN
	ini;
	WHILE nb <>taille*taille DO //tant que le nombre ecrit n'est pas egal au carre de la taille, on:
	begin
		nb := nb+1; //incremente nb
		T[i,j] := nb; //ecrit nb dans la cellule
		prevj := j; //stocke j
		j := j+1; //incremente j (on va a droite)
		IF j>taille THEN j := 1; //Si j depasse du tableau, on le remet a gauche

		previ := i;//stocke i
		i := i-1;//incremente i (on descend)
		IF i<1 THEN i := taille;//Si i depasse du tableau, on le remet en haut

		IF T[i,j] <> 0 THEN //Si la case est occupee
		begin
			i:=previ-2; //On remonte de deux par rapport à la position précédente
			IF i<1 THEN i := taille+i;//Si i depasse du tableau, on le remet en haut
			j := prevj; //on stocke le nouveau j
		end;
	end;
	aff(T);
END.
