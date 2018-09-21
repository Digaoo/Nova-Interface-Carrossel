import QtQuick 2.0
import QtMultimedia 5.8

Rectangle {

    property var instanciaVideo: null
    property var instanciaFrame: null

    id:telaCalib
    color: "black"

    anchors.fill: parent
    anchors.margins: 5

    ShaderEffectSource {

        anchors.centerIn: parent
        anchors.fill: parent
        sourceItem: instanciaVideo
    }

    onInstanciaFrameChanged:  {

        //console.log("oi")
        //Ligar booleana para ignorar proximas mudancas
        //mandar para classe em cpp
        //processar
        //trzer de volta e mostrar
    }
}
