(defmodule createProfile)
;Reglas definidas para ClassifyUser
(deftemplate usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type SYMBOL)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil media dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot numeroJugadores(type SYMBOL)(allowed-values uno, dos, MasDeDos))
)

(defrule createProfile::Fam_1_Poco
    (usuario {tiempoJuego == poco})
    (usuario {aficion == hogar})
    (usuario {numeroJugadores == uno})
    	=>
    (assert (TipoJugador Fam_1_Poco))
)

(defrule createProfile::Fam_2_Poco
    (usuario {tiempoJuego == poco})
    (usuario {aficion == hogar})
    (usuario {numeroJugadores == dos})
    	=>
    (assert (TipoJugador Fam_1_Poco))
)

(defrule createProfile::Fam_MasDos_Poco
    (usuario {tiempoJuego == poco})
    (usuario {aficion == hogar})
    (usuario {numeroJugadores == MasDeDos})
    	=>
    (assert (TipoJugador Fam_1_Poco))
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