import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtMultimedia 5.8
import CVCamera 1.0

GridLayout {

    id: layoutHome
    width: parent.width
    height: parent.height
    rows: 3
    columns: 2

    ComboBox {

        id: escolheCamera
        currentIndex: 0
        model: camera.deviceList
        Layout.preferredWidth: telaJogo.width

        Layout.maximumWidth: telaJogo.width
        Layout.maximumHeight: parent.height * 0.1

        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        Layout.margins: 5
    }

    Rectangle {

        id:checkHolder

        Layout.preferredWidth: tabelaDebug.width
        Layout.preferredHeight: escolheCamera.height*0.9

        Layout.maximumWidth: tabelaDebug.width
        Layout.maximumHeight: escolheCamera.height*0.9

        Layout.alignment: Qt.AlignRight

        CheckBox {

            id: checkArquivoTabela

            scale: 0.85

            anchors.centerIn: parent

            text: qsTr("Guardar em Arquivo")
        }
    }

    Rectangle {

        id:telaJogo

        Layout.preferredWidth: parent.width * 0.7
        Layout.preferredHeight: parent.height * 0.82
        color: "black"

        anchors.left: parent.left
        anchors.top: escolheCamera.bottom
        anchors.margins: 5

        CVCamera {

            id: camera
            device: escolheCamera.currentIndex
            size: "640x480"
        }

        VideoOutput {

            anchors.fill: parent
            source: camera;
        }

    }

    TableView {

        id: tabelaDebug

        Layout.preferredWidth: parent.width * 0.25
        Layout.preferredHeight: parent.height * 0.82

        anchors.right: parent.right
        anchors.top: checkHolder.bottom
        anchors.margins: 5

        TableViewColumn {

            role: "descrição"
            title: "Descrição"
            width: tabelaDebug.width/2
        }
        TableViewColumn {
            role: "valor"
            title: "Valor"
            width: tabelaDebug.width/2
        }
    }

    RowLayout{

        width: telaJogo.width
        height: parent.height * 0.1

        Layout.preferredWidth: telaJogo.width
        Layout.preferredHeight: parent.height * 0.1

        Layout.maximumWidth: telaJogo.width
        Layout.maximumHeight: parent.height * 0.1

        anchors.left: parent.left
        anchors.top: telaJogo.bottom
        anchors.margins: 5

        ComboBox {

            id: escolheTipoVisao
            currentIndex: 0
            model: ["Padrão"]

            Layout.preferredWidth: 2*parent.width/6
            anchors.top: parent.top
        }

        ComboBox {

            id: escolheModoJogo
            currentIndex: 0
            model: ["Jogo Normal","Penalidade","Disputa","Falta","W.O.","Posicionar"]

            Layout.preferredWidth: 2*parent.width/6
            anchors.top: parent.top
        }

        Button {

                id: botaoPlayPause
                text: qsTr("\u25B6")
                Layout.preferredWidth: 0.9*parent.width/6
                anchors.top: parent.top
                anchors.left: escolheModoJogo.right
                anchors.leftMargin: 0.09*parent.width/6

                property bool rodando: false

                onClicked: {

                    rodando = !rodando;

                    if (rodando) {

                        text = "\u23F8"
                    }

                    else {

                        text = "\u25B6"
                    }
                }
        }

        Button {

                id: botaoStop
                text: qsTr("\u25A0")
                Layout.preferredWidth: 0.9*parent.width/6
                anchors.top: parent.top
                anchors.left: botaoPlayPause.right
                anchors.leftMargin: 0.05*parent.width/6
        }
    }
}
