//
// Copyright (c) - 2023 eMyoSound
//
// Author: Yannick LA ROSA <yann.larosa@emyosound.com>
// created: date
//
// Confidential - All Rights Reserved
//

#include "date_utils.hpp"

using namespace utils;

DateTime::DateTime()
{
    // do nothing
}

DateTime::~DateTime()
{
    // do nothing
}

/**
 * Transform DateTime object into datetime string (UTC format)
 *
 * @brief DateTime::ToString
 * @return
 */
std::string DateTime::ToString() {
    std::string output{""};
    std::string d = AnyToString(nDay);
    if (d.size() < 2) {
        d.insert(0, 1, '0');
    }
    std::string m = AnyToString(nMonth);
    if (m.size() < 2) {
        m.insert(0, 1, '0');
    }
    std::string hs = AnyToString(nHours);
    if (hs.size() < 2) {
        hs.insert(0, 1, '0');
    }
    std::string ms = AnyToString(nMinutes);
    if (ms.size() < 2) {
        ms.insert(0, 1, '0');
    }
    std::string sd = AnyToString(nSeconds);
    if (sd.size() < 2) {
        sd.insert(0, 1, '0');
    }
    output += AnyToString(nYear) + "-" + m + "-" + d + " " + hs + ":" + ms + ":" + sd;
    return output;
};

/**
 * Transform the date part into a date string (US formatted)
 *
 * @brief DateTime::ToDateString
 * @return
 */
std::string DateTime::ToDateString() {
    std::string output{""};
    std::string d = AnyToString(nDay);
    if (d.size() < 2) {
        d.insert(0, 1, '0');
    }
    std::string m = AnyToString(nMonth);
    if (m.size() < 2) {
        m.insert(0, 1, '0');
    }
    output += m + "/" + d + "/" + AnyToString(nYear);
    return output;
};

/**
 * Transform the time part into a string (US formatted)
 *
 * @brief DateTime::ToTimeString
 * @return
 */
std::string DateTime::ToTimeString() {
    std::string output{""};
    std::string hs = AnyToString(nHours);
    if (hs.size() < 2) {
        hs.insert(0, 1, '0');
    }
    std::string ms = AnyToString(nMinutes);
    if (ms.size() < 2) {
        ms.insert(0, 1, '0');
    }
    std::string sd = AnyToString(nSeconds);
    if (sd.size() < 2) {
        sd.insert(0, 1, '0');
    }
    output += hs + ":" + ms + ":" + sd;
    return output;
};

/**
 * Transform the date time to string (SQL format)
 *
 * @brief DateTime::ToSqlDateTime
 * @return
 */
std::string DateTime::ToSqlDateTime()
{
    return ToString();
}

/**
 * Update date
 *
 * @brief DateTime::SetDate
 * @param year
 * @param month
 * @param day
 */
void DateTime::SetDate(int year, int month, int day)
{
    nYear = year;
    nMonth = month;
    nDay = day;
    bInitialized = true;
};

/**
 * Update time
 *
 * @brief DateTime::SetTime
 * @param hours
 * @param minutes
 * @param seconds
 */
void DateTime::SetTime(int hours, int minutes, int seconds)
{
    nHours = hours;
    nMinutes = minutes;
    nSeconds = seconds;
    bInitialized = true;
}

/**
 * Get year of date time
 *
 * @brief DateTime::GetYear
 * @return
 */
const int &DateTime::GetYear()
{
    return nYear;
}

/**
 * Get month of date time
 *
 * @brief DateTime::GetMonth
 * @return
 */
const int &DateTime::GetMonth()
{
    return nMonth;
}

/**
 * Get day of date time
 *
 * @brief DateTime::GetDay
 * @return
 */
const int &DateTime::GetDay()
{
    return nDay;
}

/**
 * Get hours of date time
 * @brief DateTime::GetHours
 * @return
 */
const int &DateTime::GetHours()
{
    return nHours;
}

/**
 * Get minutes of date time
 *
 * @brief DateTime::GetMinutes
 * @return
 */
const int &DateTime::GetMinutes()
{
    return nMinutes;
}

/**
 * Get secondes of date time
 *
 * @brief DateTime::GetSeconds
 * @return
 */
const int &DateTime::GetSeconds()
{
    return nSeconds;
}

/**
 * Get the current DateTime to timestamp microseconds
 *
 * @brief DateTime::ToTimestamp
 * @return
 */
const uint64_t DateTime::ToTimestamp()
{
    struct tm  tm;
    tm.tm_year = nYear - 1900;
    tm.tm_mon = nMonth - 1;
    tm.tm_mday = nDay - 1;
    tm.tm_hour = nHours;
    tm.tm_min = nMinutes;
    tm.tm_sec = nSeconds;
    uint64_t nTimestamp = mktime(&tm);
    return nTimestamp * 1000000; // to micro seconds
}

/**
 * Create a DateTime object given date elements
 *
 * @brief DateTime::CreateDate
 * @param year
 * @param month
 * @param day
 * @param hours
 * @param minutes
 * @param seconds
 * @return
 */
DateTime DateTime::CreateDate(int year, int month, int day, int hours, int minutes, int seconds)
{
    DateTime datetime;
    datetime.nDay = day;
    datetime.nMonth = month;
    datetime.nYear = year;
    datetime.nHours = hours;
    datetime.nMinutes = minutes;
    datetime.nSeconds = seconds;
    datetime.bInitialized = true;
    return datetime;
}

/**
 * Create a Datetime object from string date with sepcified format
 * Check the return with boolean operator if the date is correcly created
 *
 * @brief DateTime::CreateDateFromSql
 * @param strDate
 * @return
 */
DateTime DateTime::CreateDateFromFormat(std::string &strDate, const std::string &format)
{
    DateTime dt;

    std::tm t = {};
    std::istringstream ss(strDate);
    ss >> std::get_time(&t, format.c_str());

    if (!ss.fail()) {
        dt.nDay = t.tm_mday;
        dt.nMonth = 1 + t.tm_mon;
        dt.nYear = 1900 + t.tm_year;
        dt.nHours = t.tm_hour;
        dt.nMinutes = t.tm_min;
        dt.nSeconds = t.tm_sec;
        dt.bInitialized = true;
    }
    return dt;
}

/**
 * Create DateTime object related to current datetime
 *
 * @brief DateTime::Now
 * @return
 */
DateTime DateTime::Now()
{
    DateTime dt;

    std::time_t now = time(0);
    tm *ltm = localtime(&now);
    dt.nDay = ltm->tm_mday;
    dt.nMonth = 1 + ltm->tm_mon;
    dt.nYear = 1900 + ltm->tm_year;
    dt.nHours = ltm->tm_hour;
    dt.nMinutes = ltm->tm_min;
    dt.nSeconds = ltm->tm_sec;
    dt.bInitialized = true;

    return dt;
}

/**
 * Get number of microseconds spent until EPOCH time (01-01-1970)
 *
 * @brief GetCurrentTimestamp
 * @return
 */
uint64_t DateTime::GetCurrentTimestamp()
{
    const auto currentTimePoint = std::chrono::system_clock::now();
    auto delay = std::chrono::duration_cast<std::chrono::microseconds>(currentTimePoint.time_since_epoch()).count();

    return static_cast<uint64_t>(delay);
}

/**
 * Return the duration of two DateTimes
 *
 * @brief DateTime::GetDurationSeconds
 * @param from
 * @param to
 * @return
 */
long DateTime::GetDurationSeconds(DateTime from, DateTime to)
{

    uint64_t nFromTimestamp = from.ToTimestamp(); // to seconds
    uint64_t nToTimestamp = to.ToTimestamp(); // to seconds

    if(nToTimestamp > nFromTimestamp)
    {
        uint64_t diff = nToTimestamp - nFromTimestamp;
        return (diff / 1000000);
    }
    else
    {
        uint64_t diff =  nFromTimestamp - nToTimestamp;
        return -(diff / 1000000);
    }
}

/**
 * Get the formated duration bewteen two dates (1 day 10:11:54)
 *
 * @brief DateTime::GetDuration
 * @param from
 * @param to
 * @return
 */
#include <QDebug>
std::string DateTime::GetDurationString(DateTime from, DateTime to)
{
    std::string sDuration;
    long nDurationSeconds = GetDurationSeconds(from, to);

    if(nDurationSeconds < 0)
    {
        sDuration += "- ";
    }

    nDurationSeconds = std::abs(nDurationSeconds);

    // Days
    int nDays = nDurationSeconds / (24 * 3600);
    if(nDays != 0)
    {
        sDuration += std::to_string(nDays) + " days ";
    }

    // hours
    nDurationSeconds = nDurationSeconds % (24 * 3600);
    int nHours = nDurationSeconds / 3600;
    if(nHours < 10)
    {
        sDuration += "0";
    }
    sDuration += std::to_string(nHours) + ":";

    // minutes
    nDurationSeconds %= 3600;
    int nMins = nDurationSeconds / 60;
    if(nMins < 10)
    {
        sDuration += "0";
    }
    sDuration += std::to_string(nMins) + ":";

    // seconds
    nDurationSeconds %= 60;
    int nSeconds = nDurationSeconds;
    if(nSeconds < 10)
    {
        sDuration += "0";
    }
    sDuration += std::to_string(nSeconds);


    return sDuration;
}
