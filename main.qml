import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import "Arquivos"

// Janela da aplicação.
ApplicationWindow {

    id: applicationWindow
    visible: true
    visibility: ApplicationWindow.Maximized
    title: "Carrossel Caipira"
    minimumWidth: 800
    minimumHeight: 600

    property var instancia: null

    header: TabBar {

        id: abas
        currentIndex: layoutPrincipal.currentIndex

        // Botão Home
        TabButton {

            id: homeBotao
            anchors.verticalCenter: parent.verticalCenter

            Image {

                id: homeImage
                height: parent.height/1.5
                anchors.rightMargin: 6
                anchors.right: homeText.left
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                source: "Imagens/home.png"
            }

            Text {
                id: homeText
                text: qsTr("Home")
                anchors.left: homeImage.right
                anchors.centerIn: parent
            }
        }

        // Calibração Botão
        TabButton {

            id: calibracaoBotao
            anchors.verticalCenter: parent.verticalCenter

            Image {

                id: calibracaoImage
                height: parent.height/1.5
                anchors.rightMargin: 6
                anchors.right: calibracaoText.left
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                source: "Imagens/calibracao.png"
            }

            Text {
                id: calibracaoText
                text: qsTr("Calibração")
                anchors.left: calibracaoImage.right
                anchors.centerIn: parent
            }
        }

        // Botão Configurações
        TabButton {

            id: configBotao
            anchors.verticalCenter: parent.verticalCenter

            Image {

                id: configImage
                height: parent.height/1.5
                anchors.rightMargin: 6
                anchors.right: configText.left
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                source: "Imagens/configuracoes.png"
            }

            Text {
                id: configText
                text: qsTr("Configurações")
                anchors.left: configImage.right
                anchors.centerIn: parent
            }
        }

        // Botão Ajuda
        TabButton {

            id: ajudaBotao
            anchors.verticalCenter: parent.verticalCenter

            Image {

                id: ajudaImage
                height: parent.height/1.5
                anchors.rightMargin: 6
                anchors.right: ajudaText.left
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                source: "Imagens/ajuda.png"
            }

            Text {
                id: ajudaText
                text: qsTr("Ajuda")
                anchors.left: ajudaImage.right
                anchors.centerIn: parent
            }
        }

    }

    // Layout de páginas controlado pelas abas.
    StackLayout {

        id: layoutPrincipal
        anchors.fill: parent
        currentIndex: abas.currentIndex

        // Página do Home.
        Page{

            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            PaginaHome{

                id:pagHome
            }
        }

        // Página de Calibração.
        Page{

            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            PaginaCalib {

                instanciaVideo: pagHome.instanciaVideo
                instanciaFrame: pagHome.instanciaFrame
            }
        }

        // Página de Configurações.
        Page{

            PaginaConfig{}
        }

        // Página de Ajuda.
        Page{

            header: Label {

                text: qsTr("Ajuda")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
                color: "white"

                background: Rectangle {
                    color: "#2A2A2A"
                }
            }
        }
    }
}
