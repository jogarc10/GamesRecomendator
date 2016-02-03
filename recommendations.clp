(defmodule createProfile)
;Reglas definidas para ClassifyUser
(deftemplate createProfile::usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type SYMBOL)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil media dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot numeroJugadores(type SYMBOL)(allowed-values uno dos MasDeDos))
)

(defrule createProfile::Tiempo
    (createProfile::usuario (tiempoJuego  ?T))
        =>
    (assert (Tiempo ?T))
)

(defrule createProfile::Jugadores
    (createProfile::usuario (numeroJugadores ?n))
        =>
    (assert (Jugadores ?n))
)

(defrule createProfile::Familia_aficcion
    (createProfile::usuario {aficion == hogar})
        =>
    (assert (TipoBuscado familiar))
)

(defrule createProfile::Deporte_aficcion
    (createProfile::usuario {aficion == salud})
        =>
    (assert (TipoBuscado deporte))
)

(defrule createProfile::Aventura_aficcion
    (createProfile::usuario {aficion == viajar})
        =>
    (assert (TipoBuscado aventura))
)

(defrule createProfile::Inteligencia_aficcion
    (createProfile::usuario {aficion == puzzles})
        =>
    (assert (TipoBuscado inteligencia))
)

(defrule createProfile::Mas18_Edad
    (createProfile::usuario {edad > 18})
        =>
    (assert (Edad Mas18))
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule createProfile::Mas13_Edad
    (createProfile::usuario {edad > 13})
        =>
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule createProfile::TP_Edad
    (createProfile::usuario {edad > 0})
        =>
    (assert (Edad TP))
)

(defrule createProfile::Dificultad
    (createProfile::usuario (dificultad ?d))
    =>
    (assert (Dificultad ?d))
)

(defrule createProfile::Presupuesto
 (createProfile::usuario (presupuesto ?p))
    =>   
 (assert(Presupuesto ?p))
 )

(defmodule ClassifyGames)

(deftemplate ClassifyGames::juego
        (slot nombre (type SYMBOL))
        (slot tipoJuego(Type SYMBOL)(allowed-values inteligencia deporte aventura familiar))
        (slot numeroJugadores(Type SYMBOL)(allowed-values uno dos MasDeDos))
        (slot dificultad (type SYMBOL)(allowed-values facil media dificil))
        (slot tiempoJuego (type SYMBOL)(allowed-values poco medio mucho))
        (slot precio (type NUMBER))
    	(slot edadRecomendada (type SYMBOL) (allowed-values TP Mas13 Mas18))
)

(deffacts ClassifyGames::juegos
	"Lista de juegos en la base de datos"
    ; Juegos de inteligencia
(juego(nombre "Damas")
       	(tipoJuego inteligencia)
       	(numeroJugadores dos)
       	(dificultad media)
       	(tiempoJuego medio)
       	(precio 30)
    	(edadRecomendada TP))
       
(juego(nombre "Ajedrez")
       	(numeroJugadores dos)
       	(tipoJuego inteligencia)
       	(dificultad dificil)
       	(tiempoJuego mucho)
       	(precio 30)
        (edadRecomendada TP))
       
(juego(nombre "Trivial")
       	(numeroJugadores MasDeDos)
       	(tipoJuego inteligencia)
       	(dificultad media)
       	(tiempoJuego mucho)
       	(precio 30)
        (edadRecomendada Mas13))         

    ; Juegos Deportes
(juego(nombre "SportTrivial")
       	(numeroJugadores MasDeDos)
       	(tipoJuego deporte)
       	(dificultad dificil)
       	(tiempoJuego mucho)
       	(precio 20)
        (edadRecomendada TP))
       
(juego(nombre "PlayTennis")
       	(numeroJugadores dos)
       	(tipoJuego deporte)
       	(dificultad media)
       	(tiempoJuego poco)
       	(precio 18)
        (edadRecomendada Mas13))
       
(juego(nombre "Basket")
       	(numeroJugadores uno)
       	(tipoJuego deporte)
       	(dificultad facil)
       	(tiempoJuego poco)
       	(precio 18)
        (edadRecomendada Mas13))

    ; Juegos en familia
(juego(nombre "Los Hombres Lobo de Castronegro")
       	(numeroJugadores MasDeDos)
       	(tipoJuego familiar)
       	(dificultad facil)
       	(tiempoJuego poco)
       	(precio 12)
        (edadRecomendada Mas18))
       
(juego(nombre "Monopoli")
       	(numeroJugadores MasDeDos)
       	(tipoJuego familiar)
       	(dificultad media)
       	(tiempoJuego medio)
       	(precio 39)
        (edadRecomendada TP))
       
(juego(nombre "Twister")
       	(numeroJugadores MasDeDos)
       	(tipoJuego familiar)
       	(dificultad dificil)
       	(tiempoJuego mucho)
       	(precio 10)
        (edadRecomendada Mas13))
       
    ; Juegos de aventura   
(juego(nombre "The Walking dead")
       	(numeroJugadores dos)
       	(tipoJuego aventura)
       	(dificultad facil)
       	(tiempoJuego mucho)
       	(precio 12)
        (edadRecomendada Mas18))

(juego(nombre "Worldcraft")
       (numeroJugadores MasDeDos)
       (tipoJuego aventura)
       (dificultad media)
       (tiempoJuego medio)
       (precio 17)
        (edadRecomendada Mas18))
       
(juego(nombre "Minecraft")
       (numeroJugadores uno)
       (tipoJuego aventura)
       (dificultad facil)
       (tiempoJuego mucho)
       (precio 22)
       (edadRecomendada TP))

(juego(nombre "Sudoku")
       (numeroJugadores uno)
       (tipoJuego inteligencia)
       (dificultad media)
       (tiempoJuego poco)
       (precio 22)
       (edadRecomendada TP))
	)


(defmodule MatchUsersAndGames)

(deftemplate MatchUsersAndGames::Recomendation
 	(slot nombreJuego (type SYMBOL))   
 )

(defrule MatchUsersAndGames::RecommendationGame
    (createProfile::Dificultad ?d)
    (createProfile::Jugadores ?j)
    (createProfile::Presupuesto ?p)
    (createProfile::Tiempo ?t)
    (createProfile::TipoBuscado ?b)
    (createProfile::Edad ?e)
    (ClassifyGames::juego (nombre ?n)(tipoJuego ?b)(numeroJugadores ?j)(dificultad ?d)(tiempoJuego ?t)(precio ?p2)(edadRecomendada ?e))
    (test (> ?p ?p2 ))
    =>
    (assert(Recomendation (nombreJuego ?n)))
 )
 
;Reglas definidas para MatchUsersAndGames
