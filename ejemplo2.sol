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
    *
    */
    function registrar(string memory nombre, string memory titulo, uint256 fecha, bool rec) public {
        // Asignación de structs dentro de arrays
        favs[nombre] = Peliculas(titulo, fecha, rec);
    }

    function consultar(string memory nombre) public view returns (string memory, uint256, bool) {
        string memory tit = favs[nombre].titulo;
        uint256 fecha = favs[nombre].fecha;
        bool rec = favs[nombre].recomendada;

        return(tit, fecha, rec);

    }
}
