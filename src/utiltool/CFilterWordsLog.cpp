#include "CFilterWordsLog.h"
using namespace std;

CTextQuery::CTextQuery(QObject *parent)
{

}
QVariantMap CTextQuery::getTypeAndCostTime()
{
    std::ifstream infile;
    open_file(infile,"log.txt");
    QVariantMap mapData;
    string textline;
    string tempTypes;
   int loadtimestr=0;
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
        dataConvert(tempTypes,textline,outtempTypes,outtextmiles,loadtimestr);
        if(outtempTypes.size()){
            mapData.insert( QString::fromStdString(outtempTypes), QString::fromStdString(outtextmiles));
        }

    }
    emit loadData();
    return mapData;
}


void CTextQuery::dataConvert(const std::string &strType, const std::string &strLine, std::string &outType, std::string &outMile,int &loadtimestr)
{
    if(strType=="RScreen-QT"||strType=="RScreen-FD"||strType=="QtAdFdPage"||\
            strType=="QtGroupText"||strType=="FDGroupText"||strType=="List----Qt"\
            ||strType=="List--Ford"||strType=="Grid----Qt"||strType=="Grid--Ford"||strType=="Router--Qt"||strType=="RouterFord")
    {
          std::string tipTimes = std::to_string(loadtimestr);
        outType=strType + tipTimes;
        outMile = strLine.substr(strLine.length()-6,6);
        loadtimestr++;

    }
    else{
        outType="";
        outMile ="";
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
