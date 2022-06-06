% personas.
hombre(felix).
hombre(hebaristo).
hombre(francisco).
hombre(anselmo).
hombre(roberto).
hombre(diego).
hombre(ricardo).
hombre(david).
hombre(hfelix).
hombre(rodrigo).
hombre(carlos).
hombre(juan).

mujer(juliana).
mujer(amalia).
mujer(beatriz).
mujer(estela).
mujer(judith).
mujer(pamela).
mujer(valentina).
mujer(natalia).

% relaciones padre/madre de.
% padres segunda generacion.
padre(felix,francisco).
padre(felix,anselmo).
padre(felix,roberto).
padre(felix,beatriz).
madre(juliana,francisco).
madre(juliana,anselmo).
madre(juliana,roberto).
madre(juliana,beatriz).

padre(hebaristo,diego).
padre(hebaristo,estela).
padre(hebaristo,judith).
madre(amalia,diego).
madre(amalia,estela).
madre(amalia,judith).

% padres tercera gen -tios y primos-.
padre(francisco,pamela).
padre(diego,juan).

madre(beatriz,rodrigo).
madre(beatriz,carlos).

madre(judith,valentina).
madre(judith,natalia).

%Mis padres-- 3er generacion

padre(anselmo,ricardo).
padre(anselmo,hfelix).
padre(anselmo,david).
madre(estela,ricardo).
madre(estela,hfelix).
madre(estela,david).

% abuelos.
abuelo_paterno(X,Y):- padre(X,K), padre(K,Y).
abuelo_materno(X,Y):- padre(X,K), madre(K,Y).
abuela_materna(X,Y):- madre(X,K), madre(K,Y).
abuela_paterna(X,Y):- madre(X,K), padre(K,Y).


padre_hijo(Y,X):- padre(Y,X), hombre(X).
padre_hija(Y,X):- padre(Y,X), mujer(X).

madre_hijo(Y,X):- madre(Y,X), hombre(X).
madre_hija(Y,X):- madre(Y,X), mujer(X).

%hermanos(X,Y):- madre(M,X), madre(M,Y), padre(P,X), padre(P,Y), X=Y.

hermano_por_padre(X,Y):- padre(Z,X), padre(Z,Y), X\==Y, hombre(X).
hermano_por_madre(X,Y):- madre(Z,X), madre(Z,Y), X\==Y, hombre(X).

hermana_por_padre(X,Y):- padre(Z,X), padre(Z,Y), X\==Y, mujer(X).
hermana_por_madre(X,Y):- madre(Z,X), madre(Z,Y), X\==Y, mujer(X).


tio_por_padre(X,Y):- hermano_por_padre(X,Z), padre(Z,Y).
tio_por_madre(X,Y):- hermano_por_madre(X,Z), madre(Z,Y).

tia_por_padre(X,Y):- hermana_por_padre(X,Z), padre(Z,Y).
tia_por_madre(X,Y):- hermana_por_madre(X,Z), madre(Z,Y).

primos_de_tios(X,Y):- padre(A,X), padre(B,Y), hermano_por_padre(A,B).
primos_de_tios(X,Y):- padre(A,X), madre(B,Y), hermano_por_padre(A,B).
primos_de_tias(Y,X):- padre(A,X), madre(B,Y), hermano_por_madre(A,B).
primos_de_tias(Y,X):- madre(A,X), madre(B,Y), hermana_por_madre(A,B).



