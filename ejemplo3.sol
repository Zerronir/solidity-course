// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 <0.9.0;

contract ejemplo3 {
    /*
    * Función para realizar una transferencia de ethers entre cuentas
    */
    function transferEthers(address payable addr) public payable {
        addr.transfer(msg.value);
    }

    // función para comprobar el balance de la cuenta que le pasemos como parametro
    function checkBalance(address addr) public view returns(uint256) {
        return(addr.balance);
    }

}
