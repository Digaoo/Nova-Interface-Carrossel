#include "logger.h"

QFile Logger::log;
QTimer *Logger::timer;
QQueue<QString> Logger::contMsgs;
QQueue<QString> Logger::descMsgs;
bool Logger::salvarEmArquivo = false;
bool Logger::salvarOverride = false;

/**
 * @brief Logger::setup - Função que prepara as funcionalidades da classe
 */
void Logger::setup() {

    log.setFileName(QDateTime::currentDateTime().toString()+".txt");

    timer = new QTimer();
    QObject::connect(timer, &QTimer::timeout, salva);
    timer->start(1000);
}

/**
 * @brief Logger::setaNovaMsg - Função estática para mandar mensagens para a tabela da interface
 * @param desc - Descrição da mensagem mandada
 * @param msg - Mensagem
 */
void Logger::setaNovaMsg(QString desc, QString msg) {

    descMsgs.enqueue(desc);
    contMsgs.enqueue(msg);
}

/**
 * @brief Logger::pegaDescNovaMsg - Retorna a descrição da mensagem mais antiga no buffer
 * @return - A instância da descrição da mensagem mais antiga
 */
QString Logger::pegaDescNovaMsg() {

    return descMsgs.dequeue();
}

/**
 * @brief Logger::pegaContNovaMsg - Retorna o conteúdo da mensagem mais antiga no buffer
 * @return - A instância do conteúdo da mensagem mais antiga
 */
QString Logger::pegaContNovaMsg() {

    return contMsgs.dequeue();
}

/**
 * @brief Logger::salva - Função que salva logs em arquivo
 */
void Logger::salva() {

    if (contMsgs.length() >= NUM_LOGS_SALVOS || salvarOverride) {

        log.open(QIODevice::Append | QIODevice::Text);

        QTextStream saida(&log);

        while (!contMsgs.isEmpty()) {

            saida << descMsgs.dequeue() << " " << contMsgs.dequeue();
        }

        log.close();
    }

    if (salvarOverride) {

        salvarOverride=false;
        timer->stop();
    }
}

/**
 * @brief Logger::ligaDeslSalvamento - Função chamada pelo qml para ligar e desligar salvamento em arquivo
 */
void Logger::ligaDeslSalvamento() {

    salvarEmArquivo = !salvarEmArquivo;

    if (salvarEmArquivo) {

        setup();
    }

    else {

        salvarOverride = true;
    }
}

void Logger::forcarSalvamento() {

    timer->stop();
    salvarOverride = true;
    salva();
}

bool Logger::estaSalvando() {

    return salvarEmArquivo;
}
