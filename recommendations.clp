;(defmodule createProfile)
;Reglas definidas para ClassifyUser
(deftemplate usuario
    (slot edad (type NUMBER))
    (slot tiempoJuego(type SYMBOL)(allowed-values poco medio mucho))
    (slot dificultad(type SYMBOL)(allowed-values facil media dificil))
    (slot aficion(type SYMBOL)(allowed-values salud, hogar, viajar, puzzles))
    (slot presupuesto (type NUMBER))
    (slot numeroJugadores(type SYMBOL)(allowed-values uno dos MasDeDos))
)

(deftemplate juego
        (slot nombre (type SYMBOL))
        (slot tipoJuego(Type SYMBOL)(allowed-values inteligencia deporte aventura familiar))
        (slot numeroJugadores(Type SYMBOL)(allowed-values uno dos MasDeDos))
        (slot dificultad (type SYMBOL)(allowed-values facil media dificil))
        (slot tiempoJuego (type SYMBOL)(allowed-values poco medio mucho))
        (slot precio (type NUMBER))
    	(slot edadRecomendada (type SYMBOL) (allowed-values TP Mas13 Mas18))
)

(deftemplate Recomendation
 	(slot nombreJuego (type SYMBOL))   
 )
/*********************************************
************* Rules for the game *************
*********************************************/
(deffacts juegos 
	"Lista de juegos en la base de datos"
(juego(nombre "Trivial")(tipoJuego inteligencia)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego mucho)(precio 30)(edadRecomendada Mas18))
(juego(nombre "Damas")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad dificil)(tiempoJuego mucho)(precio 9)(edadRecomendada Mas13))
(juego(nombre "Apalabrados")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad facil)(tiempoJuego mucho)(precio 19)(edadRecomendada Mas18))
(juego(nombre "Pasapalabra")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad facil)(tiempoJuego mucho)(precio 32)(edadRecomendada Mas13))
(juego(nombre "Memory")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad facil)(tiempoJuego mucho)(precio 17)(edadRecomendada Mas18))
(juego(nombre "Sopa de letras")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad dificil)(tiempoJuego mucho)(precio 23)(edadRecomendada Mas13))
(juego(nombre "Cut and slice")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad facil)(tiempoJuego poco)(precio 25)(edadRecomendada TP))
(juego(nombre "Logo Quiz")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad media)(tiempoJuego medio)(precio 6)(edadRecomendada Mas13))
(juego(nombre "Logic Master")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad facil)(tiempoJuego poco)(precio 26)(edadRecomendada Mas13))
(juego(nombre "Carrera de mente")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad dificil)(tiempoJuego mucho)(precio 19)(edadRecomendada Mas13))
(juego(nombre "Mastermind")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad media)(tiempoJuego poco)(precio 20)(edadRecomendada Mas13))
(juego(nombre "Tingly Brain trainer")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad media)(tiempoJuego poco)(precio 9)(edadRecomendada Mas13))
(juego(nombre "La forma")(tipoJuego inteligencia)(numeroJugadores dos)(dificultad media)(tiempoJuego poco)(precio 10)(edadRecomendada TP))
(juego(nombre "Liquid Measure")(tipoJuego inteligencia)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego mucho)(precio 30)(edadRecomendada Mas13))
(juego(nombre "2048")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad media)(tiempoJuego mucho)(precio 5)(edadRecomendada Mas18))
(juego(nombre "Sliding Cubes 2")(tipoJuego inteligencia)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego poco)(precio 19)(edadRecomendada TP))
(juego(nombre "Linx")(tipoJuego inteligencia)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego poco)(precio 14)(edadRecomendada Mas13))
(juego(nombre "Romper Codigos")(tipoJuego inteligencia)(numeroJugadores uno)(dificultad facil)(tiempoJuego poco)(precio 18)(edadRecomendada Mas13))
(juego(nombre "TrivialSport")(tipoJuego deporte)(numeroJugadores uno)(dificultad media)(tiempoJuego poco)(precio 35)(edadRecomendada TP))
(juego(nombre "Tennis")(tipoJuego deporte)(numeroJugadores dos)(dificultad dificil)(tiempoJuego poco)(precio 33)(edadRecomendada TP))
(juego(nombre "Basket")(tipoJuego deporte)(numeroJugadores uno)(dificultad facil)(tiempoJuego medio)(precio 35)(edadRecomendada TP))
(juego(nombre "Volleyball")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego mucho)(precio 10)(edadRecomendada TP))
(juego(nombre "Formula1")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego mucho)(precio 16)(edadRecomendada Mas13))
(juego(nombre "MotoGP")(tipoJuego deporte)(numeroJugadores dos)(dificultad dificil)(tiempoJuego mucho)(precio 10)(edadRecomendada TP))
(juego(nombre "Nautica")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego poco)(precio 14)(edadRecomendada TP))
(juego(nombre "Paddel")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego mucho)(precio 9)(edadRecomendada Mas13))
(juego(nombre "Bandminton")(tipoJuego deporte)(numeroJugadores uno)(dificultad media)(tiempoJuego poco)(precio 35)(edadRecomendada Mas18))
(juego(nombre "Boxeo")(tipoJuego deporte)(numeroJugadores dos)(dificultad facil)(tiempoJuego poco)(precio 20)(edadRecomendada Mas13))
(juego(nombre "Beisbol")(tipoJuego deporte)(numeroJugadores uno)(dificultad facil)(tiempoJuego poco)(precio 30)(edadRecomendada Mas18))
(juego(nombre "Wrestling")(tipoJuego deporte)(numeroJugadores uno)(dificultad facil)(tiempoJuego medio)(precio 6)(edadRecomendada Mas18))
(juego(nombre "Bodyboard")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego poco)(precio 25)(edadRecomendada TP))
(juego(nombre "Golf")(tipoJuego deporte)(numeroJugadores uno)(dificultad media)(tiempoJuego mucho)(precio 27)(edadRecomendada Mas18))
(juego(nombre "Karate")(tipoJuego deporte)(numeroJugadores dos)(dificultad dificil)(tiempoJuego medio)(precio 32)(edadRecomendada TP))
(juego(nombre "Lacrosse")(tipoJuego deporte)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego poco)(precio 35)(edadRecomendada Mas18))
(juego(nombre "Karting")(tipoJuego deporte)(numeroJugadores dos)(dificultad facil)(tiempoJuego mucho)(precio 28)(edadRecomendada TP))
(juego(nombre "Serpientes en el desierto")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego medio)(precio 15)(edadRecomendada Mas18))
(juego(nombre "Planeta calleja")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego mucho)(precio 32)(edadRecomendada Mas13))
(juego(nombre "Desafio extremo")(tipoJuego aventura)(numeroJugadores dos)(dificultad media)(tiempoJuego poco)(precio 28)(edadRecomendada Mas13))
(juego(nombre "Himalaya")(tipoJuego aventura)(numeroJugadores uno)(dificultad dificil)(tiempoJuego poco)(precio 22)(edadRecomendada Mas13))
(juego(nombre "Spain")(tipoJuego aventura)(numeroJugadores uno)(dificultad dificil)(tiempoJuego mucho)(precio 35)(edadRecomendada Mas13))
(juego(nombre "Madrid")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego poco)(precio 24)(edadRecomendada Mas18))
(juego(nombre "Londres")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego poco)(precio 23)(edadRecomendada Mas18))
(juego(nombre "Hamburgo")(tipoJuego aventura)(numeroJugadores uno)(dificultad media)(tiempoJuego medio)(precio 28)(edadRecomendada TP))
(juego(nombre "Dunas")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego medio)(precio 8)(edadRecomendada Mas18))
(juego(nombre "Desierto Sahara")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego medio)(precio 34)(edadRecomendada TP))
(juego(nombre "Lagos del mundo")(tipoJuego aventura)(numeroJugadores uno)(dificultad dificil)(tiempoJuego poco)(precio 25)(edadRecomendada TP))
(juego(nombre "World mountains")(tipoJuego aventura)(numeroJugadores uno)(dificultad media)(tiempoJuego mucho)(precio 12)(edadRecomendada TP))
(juego(nombre "Geografiame")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego mucho)(precio 11)(edadRecomendada Mas18))
(juego(nombre "Machupichu")(tipoJuego aventura)(numeroJugadores uno)(dificultad facil)(tiempoJuego poco)(precio 18)(edadRecomendada TP))
(juego(nombre "Amazonas")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego mucho)(precio 16)(edadRecomendada TP))
(juego(nombre "Egipto")(tipoJuego aventura)(numeroJugadores MasDeDos)(dificultad media)(tiempoJuego medio)(precio 35)(edadRecomendada Mas13))
(juego(nombre "Monopoly")(tipoJuego familiar)(numeroJugadores MasDeDos)(dificultad dificil)(tiempoJuego mucho)(precio 25)(edadRecomendada TP))
(juego(nombre "Mario Kart")(tipoJuego familiar)(numeroJugadores uno)(dificultad dificil)(tiempoJuego medio)(precio 16)(edadRecomendada Mas18))
(juego(nombre "Solitario familiar")(tipoJuego familiar)(numeroJugadores dos)(dificultad dificil)(tiempoJuego mucho)(precio 5)(edadRecomendada Mas18))
(juego(nombre "Libro de la jungla")(tipoJuego familiar)(numeroJugadores uno)(dificultad facil)(tiempoJuego medio)(precio 14)(edadRecomendada Mas18))
(juego(nombre "El crucero")(tipoJuego familiar)(numeroJugadores dos)(dificultad media)(tiempoJuego medio)(precio 16)(edadRecomendada Mas13))
(juego(nombre "Lobos")(tipoJuego familiar)(numeroJugadores uno)(dificultad media)(tiempoJuego medio)(precio 34)(edadRecomendada Mas13))
(juego(nombre "Panteras")(tipoJuego familiar)(numeroJugadores dos)(dificultad media)(tiempoJuego mucho)(precio 27)(edadRecomendada TP))
(juego(nombre "El consejo de brujas")(tipoJuego familiar)(numeroJugadores dos)(dificultad dificil)(tiempoJuego medio)(precio 30)(edadRecomendada TP))
(juego(nombre "Mario bros")(tipoJuego familiar)(numeroJugadores dos)(dificultad facil)(tiempoJuego medio)(precio 14)(edadRecomendada Mas13))
(juego(nombre "Mario kart")(tipoJuego familiar)(numeroJugadores dos)(dificultad media)(tiempoJuego medio)(precio 24)(edadRecomendada TP))
(juego(nombre "Domino")(tipoJuego familiar)(numeroJugadores dos)(dificultad facil)(tiempoJuego medio)(precio 21)(edadRecomendada Mas18))
(juego(nombre "Bubble Chamrs")(tipoJuego familiar)(numeroJugadores dos)(dificultad media)(tiempoJuego medio)(precio 10)(edadRecomendada Mas13))
(juego(nombre "Zol the scape")(tipoJuego familiar)(numeroJugadores dos)(dificultad facil)(tiempoJuego poco)(precio 25)(edadRecomendada Mas13))
(juego(nombre "Cake topping")(tipoJuego familiar)(numeroJugadores uno)(dificultad facil)(tiempoJuego mucho)(precio 27)(edadRecomendada Mas13))
(juego(nombre "Sushi Slider")(tipoJuego familiar)(numeroJugadores dos)(dificultad dificil)(tiempoJuego medio)(precio 33)(edadRecomendada Mas18))
(juego(nombre "Candy Crash")(tipoJuego familiar)(numeroJugadores MasDeDos)(dificultad facil)(tiempoJuego poco)(precio 19)(edadRecomendada TP))
(juego(nombre "Playmovil")(tipoJuego familiar)(numeroJugadores dos)(dificultad media)(tiempoJuego medio)(precio 14)(edadRecomendada Mas18))

)

(defrule Tiempo
    (usuario (tiempoJuego  ?T))
        =>
    (assert (Tiempo ?T))
)

(defrule Jugadores
    (usuario (numeroJugadores ?n))
        =>
    (assert (Jugadores ?n))
)

(defrule Familia_aficcion
    (usuario {aficion == hogar})
        =>
    (assert (TipoBuscado familiar))
)

(defrule Deporte_aficcion
    (usuario {aficion == salud})
        =>
    (assert (TipoBuscado deporte))
)

(defrule Aventura_aficcion
    (usuario {aficion == viajar})
        =>
    (assert (TipoBuscado aventura))
)

(defrule Inteligencia_aficcion
    (usuario {aficion == puzzles})
        =>
    (assert (TipoBuscado inteligencia))
)

(defrule Mas18_Edad
    (usuario {edad > 18})
        =>
    (assert (Edad Mas18))
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule Mas13_Edad
    (usuario {edad > 13})
        =>
    (assert (Edad Mas13))
    (assert (Edad TP))
)

(defrule TP_Edad
    (usuario {edad > 0})
        =>
    (assert (Edad TP))
)

(defrule Dificultad
    (usuario (dificultad ?d))
    =>
    (assert (Dificultad ?d))
)

(defrule Presupuesto
 (usuario (presupuesto ?p))
    =>   
 (assert(Presupuesto ?p))
 )

/**********************************************
**************** Classify games ***************
***********************************************/

;(defmodule ClassifyGames)
;Reglas definidas para ClassifyGames
/*nombre, tipoJuego, numeroJugadores, dificultad, tiempoJuego, precio, edadRecomendada*/

  


(defrule RecommendationGame
    (Dificultad ?d)
    (Jugadores ?j)
    (Presupuesto ?p)
    (Tiempo ?t)
    (TipoBuscado ?b)
    (Edad ?e)
    (juego (nombre ?n)(tipoJuego ?b)(numeroJugadores ?j)(dificultad ?d)(tiempoJuego ?t)(precio ?p2)(edadRecomendada ?e))
    (test (> ?p ?p2 ))
    =>
    (assert(Recomendation (nombreJuego ?n)))
 )
 
;(defmodule MatchUsersAndGames)
;Reglas definidas para MatchUsersAndGames
