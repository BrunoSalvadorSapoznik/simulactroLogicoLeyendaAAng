esPersonaje(aang).
esPersonaje(katara).
esPersonaje(zoka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).

esPersonaje(iroh).


esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).

elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).

controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, rayo).


visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).

esElAvatar(Personaje):-
    esPersonaje(Personaje),
    controlaTodosLosElementosBasicos(Personaje).

/* 2 */
controlaTodosLosElementosBasicos(Personaje):-
    forall(esElementoBasico(Elemento),controla(Personaje,Elemento)).

noEsMaestro(Personaje):-
  noControlaNingunElemento(Personaje).

noControlaNingunElemento(Personaje):-
   esPersonaje(Personaje),
   esElementoBasico(ElementoBasico),
   not(controlaTodosLosElementosBasicos(Personaje)),
    noControlaNingunElementoAvanzado(Personaje).

noControlaNingunElementoAvanzado(Personaje):-
    esPersonaje(Personaje),
    forall( elementoAvanzado(ElementoAvanzado),not(controla(Personaje,ElementoAvanzado))).

elementoAvanzado(ElementoAvanzado):-
    esElementoBasico(ElementoBasico),
    elementoAvanzadoDe(ElementoBasico,ElementoAvanzado).

esMaestroPrincipiante(Personaje):-
    controla(Personaje,ElementoBasico),
    noControlaNingunElementoAvanzado(Personaje),

esMaestroAvanzado(Personaje):-
    elementoAvanzado(ElementoAvanzado),
    controla(Personaje,ElementoAvanzado).
