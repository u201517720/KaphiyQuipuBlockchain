// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract NotaIngresoPlanta  {
    struct ControlCalidad {
        string correlativo;
        string olores;
        string colores;
        string exportableGramos;
        string exportablePorcentaje;
        string descarteGramos;
        string descartePorcentaje;
        string cascarillaGramos;
        string cascarillaPorcentaje;
        string totalGramos;
        string totalPorcentaje;
        string humedadPorcentaje;
        string usuario;
        uint256 fechaRegistro;
    }

    struct ResultadoTransformacion {
        string correlativo;
        string cafeExportacionSacos;
        string cafeExportacionKilos;
        string cafeExportacionMCSacos;
        string cafeExportacionMCKilos;
        string cafeSegundaSacos;
        string cafeSegundaKilos;
        string cafeDescarteMaquinaSacos;
        string cafeDescarteMaquinaKilos;
        string cafeDescarteEscojoSacos;
        string cafeDescarteEscojoKilos;
        string cafeBolaSacos;
        string cafeBolaKilos;
        string cafeCiscoSacos;
        string cafeCiscoKilos;
        string totalCafeSacos;
        string totalCafeKgNetos;
        string piedraOtrosKgNetos;
        string cascaraOtrosKgNetos;
        string usuario;
        uint256 fechaRegistro;
    }

    mapping (string => ControlCalidad) private mappingControlCalidad;
    mapping (string => ResultadoTransformacion) private mappingResultadoTransformacion;

    function agregarControlCalidad( ControlCalidad memory controlCalidad) public {
        mappingControlCalidad[controlCalidad.correlativo] = controlCalidad;
    }

    function obtenerControlCalidad(string memory correlativo) public view returns(ControlCalidad memory) {
        return mappingControlCalidad[correlativo];
    }

    function agregarResultadoTransformacion(ResultadoTransformacion memory resultado) public {
        mappingResultadoTransformacion[resultado.correlativo] = resultado;
    }

    function obtenerResultadoTransformacion(string memory correlativo) public view returns(ResultadoTransformacion memory) {
        return mappingResultadoTransformacion[correlativo];
    }

}