#include "dialog.h"

Dialog::Dialog(QObject *parent)
    : QObject{parent}
{
    m_debugVal = 3;
}

Dialog::~Dialog()
{
}
