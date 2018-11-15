#include "mysettings.h"

MySettings::MySettings() : QSettings ()
{
    
}

void MySettings::write(const std::shared_ptr<Patient> arg)
{
    
}

void MySettings::read(const std::shared_ptr<Patient> arg)
{
    
}

bool MySettings::isFirstStart()
{
    return this->value("firstStart", true).toBool();
}
