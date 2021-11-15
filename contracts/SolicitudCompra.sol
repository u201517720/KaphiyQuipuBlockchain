// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract SolicitudCompra {
    address public owner;

    struct Solicitud {
        string correlativo;
        string tipoProduccion;
        string producto;
        string subProducto;
        string gradoPreparacion;
        string calidad;
        string distribuidor;
        string usuario;
        uint256 fecRegistro;
    }

    Solicitud[] solicitudes;
    
    mapping (string => Solicitud) private mappingSolicitud;
    
    // function agregarSolicitud(string memory pais, string memory departamento, string memory moneda, string memory unidadMedida, string memory tipoProduccion,
    //                           string memory empaque, string memory tipoEmpaque, string memory producto, string memory subProducto,  string memory gradoPreparacion, 
    //                           string memory calidad, uint256 cantidadSolicitar, uint256 pesoSaco, uint256 pesoKilo,  string memory usuario ) public {
        
    // }

    // function agregarSolicitud(Solicitud memory solicitud) public returns(bool) {
    //     solicitudes.push(solicitud);
    //     return true;
    // }

    function agregarSolicitud(string memory correlativo, string memory tipoProduccion, string memory producto, string memory subProducto, string memory gradoPreparacion,
                              string memory calidad, string memory distribuidor, string memory usuario, uint256 fecRegistro) public returns(bool) {
        mappingSolicitud[correlativo].correlativo = correlativo;
        mappingSolicitud[correlativo].tipoProduccion = tipoProduccion;
        mappingSolicitud[correlativo].producto = producto;
        mappingSolicitud[correlativo].subProducto = subProducto;
        mappingSolicitud[correlativo].gradoPreparacion = gradoPreparacion;
        mappingSolicitud[correlativo].calidad = calidad;
        mappingSolicitud[correlativo].distribuidor = distribuidor;
        mappingSolicitud[correlativo].usuario = usuario;
        mappingSolicitud[correlativo].fecRegistro = fecRegistro;

        solicitudes.push(mappingSolicitud[correlativo]);

        return true;
    }
    
    function obtenerSolicitud(string memory correlativo) public view returns (Solicitud memory) {
        return mappingSolicitud[correlativo];
    }

    function obtenerTotalSolicitudes() public view returns (uint256) {
        return solicitudes.length;
    }
    // function agregarSolicitud(Solicitud memory solicitud) public returns(bool) {
    //     solicitudes.push(solicitud);
    //     return true;
    // }
}
