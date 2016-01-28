(defmodule createProfile)
;Reglas definidas para ClassifyUser
(deftemplate usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type SYMBOL)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil medio dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot numeroJugadores(type SYMBOL)(allowed-values uno, dos, MasDeDos))
)

(defrule createProfile::Fam_1_poco
	(numeroJugadores == uno)
    =>
    (assert(TipoJugador Fam_uno_poco)) 
)
 

;(defmodule ClassifyGames)
;Reglas definidas para ClassifyGames
(deftemplate juego
		(slot nombre (type SYMBOL))
    	(slot numeroJugadores(Type SYMBOL)(allowed-values uno, dos, MasDeDos))
    	(slot dificultad (type SYMBOL)(allowed-values facil medio dificil))
    	(slot tiempoJuego (type SYMBOL)(allowed-values poco medio mucho))
    	(slot precio (type NUMBER))
)

;(defmodule MatchUsersAndGames)
;Reglas definidas para MatchUsersAndGames