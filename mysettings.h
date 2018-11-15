#ifndef MYSETTINGS_H
#define MYSETTINGS_H

#include <QSettings>
#include <memory>
#include "patient.h"

class MySettings : public QSettings
{
    Q_OBJECT
public:
    MySettings();
public slots:
    
    void write(const std::shared_ptr<Patient> arg);
    void read(const std::shared_ptr<Patient> arg);
    bool isFirstStart();
    
};

#endif // MYSETTINGS_H
