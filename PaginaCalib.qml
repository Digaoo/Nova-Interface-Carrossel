import QtQuick 2.0
import QtMultimedia 5.8

Rectangle {

    property var instanciaVideo: null

    id:telaCalib
    color: "black"

    anchors.fill: parent
    anchors.margins: 5

    ShaderEffectSource {

        id:video
        anchors.fill: parent
        sourceItem: instanciaVideo
    }
}
