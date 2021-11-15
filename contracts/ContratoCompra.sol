// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract ContratoCompra {
    address public owner;

    struct Contrato {
        string correlativo;
        string distribuidor;
        string producto;
        string subProducto;
        string tipoProduccion;
        string calidad;
        string gradoPrepracion;
        uint256 fechaSolicitud;
    }

    struct Agricultor {
        string contrato;
        string nroDocumento;
        string finca;
        string certificacion;
    }

    struct ControlCalidad {
        string porcentajeHumedad;
        string olor;
        string color;
        string observacion;
        string responsable;
    }

    struct AnalisisFisicoCafe {
        uint256 cafe_gramos;
        string cafe_porcentaje;
        uint256 descarte_gramos;
        string descarte_porcentaje;
        uint256 cascara_gramos;
        string cascara_porcentaje;
        uint256 total_gramos;
        string total_porcentaje;
    }

    struct NotaIngresoAlmacenAcopio {
        string correlativo;
        string almacen;
        uint256 fecha;
    }

    Contrato[] contratos;
    mapping (string => Contrato) private mappingContrato;
    mapping (string => Agricultor[]) private mappingAgricultor;
    mapping (uint256 => ControlCalidad) private mappingControlCalidad;
    mapping (string => AnalisisFisicoCafe) private mappingAnalisisFisicoCafe;
    mapping (string => NotaIngresoAlmacenAcopio) private mappingNotaIngresoAlmacenAcopio;

    event nuevo_contrato(string correlativo, string distribuidor, string producto, string subProducto, string tipoProduccion, string  calidad, string gradoPrepracion, uint256 fechaSolicitud);
    event nuevo_agricultor(string contrato, string nroDocumento, string finca, string certificacion);
    event agregar_control_calidad(uint256 contratoSocioFincaId, string porcentajeHumedad, string olor, string color, string observacion, string responsable);
    event agregar_analisis_fisico(string guia, uint256 cafe_gramos, string cafe_porcentaje, uint256 descarte_gramos, string descarte_porcentaje, uint256 cascara_gramos, string cascara_porcentaje, 
                                  uint256 total_gramos, string total_porcentaje);
    event agregar_nota_ingreso_almacen_acopio(string correlativo, string almacen, uint256 fecha);

    function agregarContrato(string memory correlativo, 
                              string memory distribuidor, 
                              string memory producto, 
                              string memory subProducto, 
                              string memory tipoProduccion,
                              string memory calidad, 
                              string memory gradoPrepracion, 
                              uint256 fechaSolicitud) public {

        mappingContrato[correlativo].correlativo = correlativo;
        mappingContrato[correlativo].distribuidor = distribuidor;
        mappingContrato[correlativo].producto = producto;
        mappingContrato[correlativo].subProducto = subProducto;
        mappingContrato[correlativo].tipoProduccion = tipoProduccion;
        mappingContrato[correlativo].calidad = calidad;
        mappingContrato[correlativo].gradoPrepracion = gradoPrepracion;
        mappingContrato[correlativo].fechaSolicitud = fechaSolicitud;

        contratos.push(mappingContrato[correlativo]);

        emit nuevo_contrato(correlativo, distribuidor, producto, subProducto, tipoProduccion, calidad, gradoPrepracion, fechaSolicitud);
    }
    
    function obtenerContrato(string memory correlativo) public view returns (Contrato memory) {
        return mappingContrato[correlativo];
    }

    function obtenerTotalContratos() public view returns (uint256) {
        return contratos.length;
    }

    function agregarAgricultor(string memory contrato, string memory nroDocumento, string memory finca, string memory certificacion) public {
        Agricultor memory agricultor = Agricultor(contrato, nroDocumento, finca, certificacion);
        Agricultor[] storage agricultores = mappingAgricultor[contrato];
        agricultores.push(agricultor);

        emit nuevo_agricultor(contrato, nroDocumento, finca, certificacion);
    }

    function obtenerAgricultores(string memory contrato) public view returns (Agricultor[] memory) {
        return mappingAgricultor[contrato];
    }

    function agregarControlCalidad(uint256 contratoSocioFincaId, string memory porcentajeHumedad, string memory olor, string memory color, string memory observacion, string memory responsable) public {
        mappingControlCalidad[contratoSocioFincaId] = ControlCalidad(porcentajeHumedad, olor, color, observacion, responsable);

        emit agregar_control_calidad(contratoSocioFincaId, porcentajeHumedad, olor, color, observacion, responsable);
    }

    function obtenerControlCalidad(uint256 contratoSocioFincaId) public view returns(ControlCalidad memory) {
        return mappingControlCalidad[contratoSocioFincaId];
    }

    function agregarAnalisisFisicoCafe(string memory guia, uint256 cafe_gramos, string memory cafe_porcentaje, uint256 descarte_gramos, string memory descarte_porcentaje, uint256 cascara_gramos,
                                       string memory cascara_porcentaje, uint256 total_gramos, string memory total_porcentaje) public {
        mappingAnalisisFisicoCafe[guia] = AnalisisFisicoCafe(cafe_gramos, cafe_porcentaje, descarte_gramos, descarte_porcentaje, cascara_gramos, cascara_porcentaje, total_gramos, total_porcentaje);                                           

        emit agregar_analisis_fisico(guia, cafe_gramos, cafe_porcentaje, descarte_gramos, descarte_porcentaje, cascara_gramos, cascara_porcentaje, total_gramos, total_porcentaje);
    }

    function obtenerAnalisisFisicoCafe(string memory guia) public view returns(AnalisisFisicoCafe memory) {
        return mappingAnalisisFisicoCafe[guia];
    }

    function agregarNotaIngresoAlmacenAcopio(string memory correlativo, string memory almacen, uint256 fecha) public {
        mappingNotaIngresoAlmacenAcopio[correlativo] = NotaIngresoAlmacenAcopio(correlativo, almacen, fecha);

        emit agregar_nota_ingreso_almacen_acopio(correlativo, almacen, fecha);
    }

    function obtenerNotaIngresoAlmacenAcopio(string memory correlativo) public view returns(NotaIngresoAlmacenAcopio memory) {
        return mappingNotaIngresoAlmacenAcopio[correlativo];
    }
}