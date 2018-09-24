#ifndef LOGGER_H
#define LOGGER_H

#include <QObject>
#include <QQueue>
#include <QFile>
#include <QDateTime>
#include <QTimer>
#include <QTextStream>

#define NUM_LOGS_SALVOS 10

class Logger : public QObject{

    Q_OBJECT

public:

    static void setup();
    static void setaNovaMsg(QString desc, QString msg);
    static QString pegaDescNovaMsg();
    static QString pegaContNovaMsg();
    Q_INVOKABLE static void ligaDeslSalvamento();
    Q_INVOKABLE static void forcarSalvamento();
    Q_INVOKABLE static bool estaSalvando();

private:

    static void salva();

    static bool salvarEmArquivo;
    static QQueue<QString> contMsgs;
    static QQueue<QString> descMsgs;
    static QFile log;
    static QTimer *timer;
    static bool salvarOverride;
};

#endif // LOGGER_H
