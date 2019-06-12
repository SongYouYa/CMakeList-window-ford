#include "CFilterWordsLog.h"
using namespace std;

CTextQuery::CTextQuery(QObject *parent)
{

}
  QVariantMap CTextQuery::getTypeAndCostTime()
{
    std::ifstream infile;
    open_file(infile,"navigation2.log");
   QVariantMap mapData;
    string textline;
    string tempTypes;
    while (getline(infile, textline)) {
        //根据类型进行存储为map格式
        //judge the row is  not empty
        if(textline.size()){
            tempTypes = textline.substr(0,10);
        }else{
            break;
        }
        string outtextmiles="";
        string outtempTypes="";

        dataConvert(tempTypes,textline,outtempTypes,outtextmiles);
        if(outtempTypes.size()){
             mapData.insert( QString::fromStdString(outtempTypes), QString::fromStdString(outtextmiles));
        }

    }
    emit loadData();
    return mapData;
}

void CTextQuery::dataConvert(const std::string &strType, const std::string &strLine, std::string &outType, std::string &outMile)
{

    if(strType=="RScreen-QT"){
        outMile = strLine.substr(strLine.length()-6,6);
        outType=strType;
    }
    else if(strType=="RScreen-FD"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="QtAdFdPage"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="QtGroupText"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="FDGroupText"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="List----Qt"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="List--Ford"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="Grid----Qt"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }
    else if(strType=="Grid--Ford"){
        outType=strType;
        outMile = strLine.substr(strLine.length()-6,6);
    }

}

std::ifstream& CTextQuery::open_file(std::ifstream &in, const std::string &file)
{

    in.close();     // close in case it was already open
    in.clear();     // clear any existing errors
    // if the open fails, the stream will be in an invalid state
    in.open(file.c_str()); // open the file we were given
    return in; // condition state is good if open succeeded
}
