import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtMultimedia 5.8
import CVCamera 1.0

ScrollView{

    id: layoutConfig
    anchors.fill: parent

    property var instanciaCamera: null

    ColumnLayout {

        anchors.fill: parent

        /**

          Frame do número de robôs
        */
        Frame {

            id:frameNumRobos
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameNumRobos.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Número de Robôs</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameNumRobos.width
                    }
                }

                SpinBox {

                    id: numRobos

                    anchors.horizontalCenter: parent.horizontalCenter

                    from: 3
                    value: 3
                    to: 9
                }
            }
        }

        /**

          Frame de orientação
        */
        Frame {

            id:frameOrientacao
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameOrientacao.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Orientação</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameOrientacao.width
                    }
                }

                RowLayout {

                    spacing: 50
                    anchors.horizontalCenter: parent.horizontalCenter

                    RadioButton {

                        text: "Esquerda → Direita"
                        checked: true
                    }

                    RadioButton {

                        anchors.right: parent.right
                        text: "Direita → Esquerda"
                    }
                }
            }
        }

        /**

          Frame de roteiros
        */
        Frame {

            id:frameRoteiros
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameRoteiros.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Roteiros</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameRoteiros.width
                    }
                }

                ComboBox {

                    id: escolheRoteiro
                    currentIndex: 0
                    model: ["Ofensiva"]

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        /**

          Frame de gravação em buffer - "Deprecated"
        */
        Frame {

            visible: false

            id:frameGravacaoBuffer
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameGravacaoBuffer.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Gravação em Buffer</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameGravacaoBuffer.width
                    }
                }

                CheckBox {

                    id: ligaGravacaoBuffer
                    text: qsTr('Gravar em Buffer')

                    anchors.horizontalCenter: parent.horizontalCenter

                    property bool gravando: false

                    onClicked: {

                        gravando = !gravando
                    }
                }
            }
        }

        /**

          Frame de captura do campo vazio - "Deprecated"
        */
        Frame {

            visible: false

            id:frameCapturaCampoVazio
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameCapturaCampoVazio.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Gravação em Buffer</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameCapturaCampoVazio.width
                    }
                }

                Button {

                        id: botaoCaptura
                        text: qsTr("Capturar")

                        anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        /**

          Frame de taxa de uso do campo vazio - "Deprecated"
        */
        Frame {

            visible: false

            id:frameTaxaCampoVazio
            width: layoutConfig.width
            height: children.height*1.2

            Layout.preferredWidth: layoutConfig.width - 10
            Layout.preferredHeight:  children.height*1.2
            Layout.margins: 5

            topPadding: 0
            leftPadding: 0
            rightPadding: 0

            ColumnLayout {

                width: frameTaxaCampoVazio.width
                height: children.height
                spacing: 10

                Label {

                    text: qsTr('<b>Gravação em Buffer</b>')
                    font.pixelSize: 18
                    padding: 10
                    color: "white"
                    anchors.top: parent.top

                    background: Rectangle {

                        color: "#2A2A2A"
                        width: frameTaxaCampoVazio.width
                    }
                }

                Label {

                    text: qsTr(''+sliderTaxaCampoVazio.value)
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Slider {

                    id: sliderTaxaCampoVazio

                    from: 0
                    value: 0
                    to: 100
                    stepSize: 1

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
