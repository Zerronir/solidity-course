// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 <0.9.0;

contract ejemplo2 {

    struct Peliculas {
        string titulo;
        uint256 fecha;
        bool recomendada;
    }

    mapping(string => Peliculas) favs;

    /**
    * Funciones para las películas
    */
    function setPelicula(string memory nombre, string memory titulo, uint256 fecha, bool rec) public {
        // Asignación de structs dentro de arrays
        favs[nombre] = Peliculas(titulo, fecha, rec);
    }

    function getPelicula(string memory nombre) public view returns (string memory, uint256, bool) {
        string memory tit = favs[nombre].titulo;
        uint256 fecha = favs[nombre].fecha;
        bool rec = favs[nombre].recomendada;

        return(tit, fecha, rec);

    }

    struct Viajes {
        string destino;
        // uint === uint256
        uint precio;
    }

    mapping(uint256 => Viajes) viajes_fechas;

    // Middleware equivalent
    modifier checkDate(uint fecha) {
        require(viajes_fechas[fecha].precio == 0, "hay viaje");
        _; // Para indicar que se usa en la función
    }

    function setViaje(uint fecha, string memory dest, uint precio) checkDate(fecha) public {
        viajes_fechas[fecha] = Viajes(dest, precio);
    }

    function getViaje(uint fecha) public view returns(string memory, uint) {
        return(viajes_fechas[fecha].destino, viajes_fechas[fecha].precio);
    }

}
