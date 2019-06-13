#ifndef __TEXTQUERY_H__
#define __TEXTQUERY_H__

#include <QObject>
#include <sstream>
#include <string>
#include <iostream>
#include <fstream>
#include <stdexcept>
#include <QVariantMap>
class CTextQuery :public QObject
{

    Q_OBJECT
public:
    // interface:
    Q_INVOKABLE  CTextQuery(QObject *parent=0);
    Q_INVOKABLE QVariantMap getTypeAndCostTime();


signals:
    void loadData();//no using

private:
    Q_INVOKABLE void dataConvert(const std::string &strType, const std::string &strLine, std::string &outType, std::string &outMile,int &loadtimestr);
    Q_INVOKABLE  std::ifstream& open_file(std::ifstream &in, const std::string &file);
};
#endif
